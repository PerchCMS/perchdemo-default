<?php
    require('../../../../../runtime.php');

    if (PerchUtil::count($_FILES)) {
        $API = new PerchAPI(1.0, 'miu_image_upload');

        $is_image = true;
        if ($_POST['image']=='false') $is_image = false;


        /* -------- GET THE RESOURCE BUCKET TO USE ---------- */
        $bucket_name  = 'default';

        if (isset($_POST['bucket']) && $_POST['bucket']!='') {
            $bucket_name = $_POST['bucket'];
        }

        $Perch = Perch::fetch();
        $bucket = $Perch->get_resource_bucket($bucket_name);

        // test to see if image folder is writable
        $bucket_writable = is_writable($bucket['file_path']);
        
        if ($is_image) {
            $width = false;
            if (isset($_POST['width'])) $width = (int)$_POST['width'];
        
            $height = false;
            if (isset($_POST['height'])) $height = (int)$_POST['height'];
        
            $crop = false;
            if (isset($_POST['crop']) && $_POST['crop']=='true') $crop = true;
            
            $quality = false;
            if (isset($_POST['quality'])) $quality = (int)$_POST['quality'];

            $sharpen = false;
            if (isset($_POST['sharpen'])) $sharpen = (int)$_POST['sharpen'];

            $density = false;
            if (isset($_POST['density'])) $density = (int)$_POST['density']; 

            $Image = $API->get('Image');

            if ($quality) $Image->set_quality($quality);
            if ($sharpen) $Image->set_sharpening($sharpen);
            if ($density) $Image->set_density($density);
        }
        
        
        foreach($_FILES as $file) {
            if ($bucket_writable && (int) $file['size'] > 0 && $file['error']=='0') {

                $filename = PerchUtil::tidy_file_name($file['name']);
                if (strpos($filename, '.php')!==false) $filename .= '.txt'; // diffuse PHP files
                $target = PerchUtil::file_path($bucket['file_path'].'/'.$filename);

                if (file_exists($target)) {                                        
                    $dot = strrpos($filename, '.');
                    $filename_a = substr($filename, 0, $dot);
                    $filename_b = substr($filename, $dot);

                    $count = 1;
                    while (file_exists(PerchUtil::file_path($bucket['file_path'].'/'.PerchUtil::tidy_file_name($filename_a.'-'.$count.$filename_b)))) {
                        $count++;
                    }

                    $filename   = PerchUtil::tidy_file_name($filename_a . '-' . $count . $filename_b);
                    $target     = PerchUtil::file_path($bucket['file_path'].'/'.$filename);

                }
                                            
                PerchUtil::move_uploaded_file($file['tmp_name'], $target);
    
                if ($is_image) {
                    $out = $Image->resize_image($target, $width, $height, $crop);

                    if (is_array($out)) {
                        echo $out['web_path'];
                        exit;
                    }
                }else{
                    echo $bucket['web_path'].'/'.$filename;
                    exit;
                }
                
            }
        }

    }

    echo 'FAIL';
?>