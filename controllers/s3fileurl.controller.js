const { GetObjectCommand, PutObjectCommand } = require("@aws-sdk/client-s3");
const { getSignedUrl } = require("@aws-sdk/s3-request-presigner");
require("dotenv").config();
const asyncHandler = require("../middlewares/asyncHandler");
const { s3 } = require("../configs/s3_config"); // Import the S3 client from config.js

const Bucket = process.env.AWS_BUCKET_NAME; // Your S3 bucket name
//const Key ='farmpond4.pdf';
const Expires = 90; // URL valid for 90 seconds
const ContentType = 'application/pdf'; // Set the content type to PDF

 //get-upload url
 exports.getUploadUrl = asyncHandler(async (req, res) => {
    const Key = req.query.fileName;
    if (!Key) {
        return res.status(400).json({ error: "Missing 'fileName' in query params" });
      }
      
    //console.log(Key);


  const command = new PutObjectCommand({Bucket, Key, ContentType});
  try {
    const uploadURL = await getSignedUrl(s3,command, {Expires});
    //console.log('Upload URL (Server):', uploadURL);
    //return uploadURL;
    res.json(uploadURL);
   
  } catch (error) {
    console.error('Error generating presigned URL', error);
    //res.status(500).send('Error generating presigned URL');
    throw error;
  }
});

//get-download url
exports.getDownloadUrl = asyncHandler( async (req, res) => {
    const Key = req.query.fileName;
  const command = new GetObjectCommand({ Bucket, Key });
  try {
    const downloadURL = await getSignedUrl(s3, command, { Expires });
    //console.log('Download URL (Server):', downloadURL);
    res.json(downloadURL);
  } catch (error) {
    console.error('Error generating presigned URL', error);
    //res.status(500).send('Error generating presigned URL');
    throw error;
  }
});