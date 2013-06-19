<?php
    require('../../../../../runtime.php');

    if (PerchUtil::count($_FILES)) {
        $API = new PerchAPI(1.0, 'miu_image_upload');

        $is_image = true;
        if ($_POST['image']=='false') $is_image = false;
        
        $image_folder_writable = is_writable(PERCH_RESFILEPATH);
        
        if ($is_image) {
            $width = false;
            if (isset($_POST['width'])) $width = (int)$_POST['width'];
        
            $height = false;
            if (isset($_POST['height'])) $height = (int)$_POST['height'];
        
            $crop = false;
            if (isset($_POST['crop']) && $_POST['crop']=='true') $crop = true;
            
            $Image = $API->get('Image');
        }
        
        
        foreach($_FILES as $file) {
            if ($image_folder_writable && (int) $file['size'] > 0 && $file['error']=='0') {
                $filename = PerchUtil::tidy_file_name($file['name']);
                if (strpos($filename, '.php')!==false) $filename .= '.txt'; // diffuse PHP files
                $target = PERCH_RESFILEPATH.DIRECTORY_SEPARATOR.$filename;
                if (file_exists($target)) {
                    $filename = PerchUtil::tidy_file_name(time().'-'.$filename);
                    $target = PERCH_RESFILEPATH.DIRECTORY_SEPARATOR.$filename;
                }
                                            
                PerchUtil::move_uploaded_file($file['tmp_name'], $target);
    
                if ($is_image) {
                    $out = $Image->resize_image($target, $width, $height, $crop);

                    if (is_array($out)) {
                        echo $out['web_path'];
                        exit;
                    }
                }else{
                    echo PERCH_RESPATH.'/'.$filename;
                    exit;
                }
                
            }
        }

    }

    echo 'FAIL';
?>