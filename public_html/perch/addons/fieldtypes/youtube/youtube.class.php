<?php
/**
 * A field type for YouTube videos
 *
 * @package default
 * @author Drew McLellan
 */
class PerchFieldType_youtube extends PerchAPI_FieldType
{
    
    private $api_url = 'http://gdata.youtube.com/feeds/api/videos/';
    

    /**
     * Output the form fields for the edit page
     *
     * @param array $details 
     * @return void
     * @author Drew McLellan
     */
    public function render_inputs($details=array())
    {
        $id = $this->Tag->input_id();
        $val = '';
        
        if (isset($details[$id]) && $details[$id]!='') {
            $json = $details[$id];
            $val  = $json['path']; 
        }else{
            $json = array();
        }
        
        $s = $this->Form->text($this->Tag->input_id(), $val);
        
        if (isset($json['youtubeID'])) {
            $s.= '<div class="preview"><iframe width="320" height="240" src="http://www.youtube.com/embed/'.$json['youtubeID'].'" frameborder="0"></iframe></div>';
        }
        
        return $s;
    }
    
    
    /**
     * Read in the form input, prepare data for storage in the database.
     *
     * @param string $post 
     * @param object $Item 
     * @return void
     * @author Drew McLellan
     */
    public function get_raw($post=false, $Item=false) 
    {
        $store = array();
                
        $id = $this->Tag->id();

        if ($post===false) {
            $post = $_POST;
        }
        
        if (isset($post[$id])) {
            $this->raw_item = trim($post[$id]);
            $url = $this->raw_item;
        }
        
		if ($url) {
	        $store['path'] = $url;
	        $store['youtubeID'] = $this->get_id($url);
        
	        $details = $this->get_details($store['youtubeID']);
        
	        if ($details) {
	            $store = array_merge($store, $details);
	            $store['_title'] = $store['title'];
	        }
		}
        

        
        return $store;
    }
    
    /**
     * Take the raw data input and return process values for templating
     *
     * @param string $raw 
     * @return void
     * @author Drew McLellan
     */
    public function get_processed($raw=false)
    {    
        if (is_array($raw)) {
            
            $item = $raw;
            
            
            if ($this->Tag->output() && $this->Tag->output()!='path') {
                switch($this->Tag->output()) {        
                    case 'title':
                        return isset($item['title']) ? $item['title'] : false; 
                        break;
                        
                    case 'url':
                        return isset($item['url']) ? $item['url'] : false;
                        break;

                    case 'id':
                        return isset($item['youtubeID']) ? $item['youtubeID'] : false;
                        break;
                }
            }
    
            return $item['path'];
        }
        return $raw;
    }
    
    /**
     * Get the value to be used for searching
     *
     * @param string $raw 
     * @return void
     * @author Drew McLellan
     */
    public function get_search_text($raw=false)
    {
        if ($raw===false) $raw = $this->get_raw();
        if (!PerchUtil::count($raw)) return false;

        if (isset($raw['title'])) return $raw['title'];

		return false;
    }
    
    
    
    
	
	
	/**
	 * Finds the YouTube video ID from a YouTube URL
	 *
	 * @param string $url YouTube video page URL
	 * @return string YouTube ID
	 * @author Drew McLellan
	 */
    private function get_id($url)
	{
		$query = parse_url($url, PHP_URL_QUERY);
		if ($query) {
			parse_str($query, $parts);
			if (is_array($parts) && isset($parts['v'])) {
				return $parts['v'];
			} 
		}
		return false;
	}
	
	
	/**
	 * Get information about the video with the given ID.
	 *
	 * @param string $videoID A YouTube video ID
	 * @return array Assoc array of video details
	 * @author Drew McLellan
	 */
	private function get_details($videoID)
	{
		$url = $this->api_url . $videoID;
		
		$ch 	= curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT, 10);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
		$xml_string = curl_exec($ch);
		curl_close($ch);
		
		if ($xml_string) {
			$xml = simplexml_load_string($xml_string);
			
			$c = $xml->xpath('*/media:content[@type="application/x-shockwave-flash"]');
			
			if (PerchUtil::count($c)) {
			    $out = array();
    			$out['title'] 	= strval($xml->title);
    			$out['url']		= strval($c[0]['url']);
		
    			return $out;
    		}
		}
		
		return false;
	}


}

?>