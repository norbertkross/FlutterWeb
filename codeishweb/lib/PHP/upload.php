<?php
//check is POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    //check image upload, your want to check for other things too like: is it an image?
    if(isset($_FILES['img']['name'])){

        //make filename for new file
        $uploadfile = basename($_FILES['img']['name']);

        //move the upload
        if (move_uploaded_file($_FILES['img']['tmp_name'], $uploadfile)) {

            /* HttpRequest - I dont use it, it should work but if like me, 
              its class not found, then this condition will revert to curl */
            if(class_exists('HttpRequest')){
                try {
                    $r = new HttpRequest('http://deviantsart.com', HttpRequest::METH_POST);
                    $r->addPostFile('file', $_SERVER['DOCUMENT_ROOT'].'/'.$uploadfile);

                    $resp = $r->send()->getBody();
                } catch (HttpException $ex) {
                    $resp = $ex;
                }
            }
            //simplez curl POST file
            else{
                $ch = curl_init('http://deviantsart.com');
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_POST, true);
                curl_setopt($ch, CURLOPT_TIMEOUT, 30);
                curl_setopt($ch, CURLOPT_POSTFIELDS, array(
                    'file'=>'@'.$_SERVER['DOCUMENT_ROOT'].'/'.$uploadfile,
                ));

                $resp = curl_exec($ch);
            }

            //decode the json response
            $resp = json_decode($resp, true);
        }
    }

}

?>


<form enctype="multipart/form-data" action="" method="POST">
    <!-- Name of input element determines name in $_FILES array -->
    Send this file: <input name="img" type="file" />
    <input type="submit" value="Send File" />
</form>