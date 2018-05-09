package com.example.demo;

import java.io.InputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class ConnectToS3 
{
	@Value("#{environment.AWS_ACCESSKEY}")
	String accesskey;
	
	@Value("#{environment.AWS_SECRETKEY}")
	String secretkey;

	public String upload(String fileName, InputStream inputStream) 
	{
		BasicAWSCredentials awsCreds = new BasicAWSCredentials(accesskey, secretkey);
		
		AmazonS3 s3Client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(awsCreds))
				.withRegion(Regions.US_EAST_1)
				.build();		
		PutObjectRequest putObj = new PutObjectRequest("springbkt1", fileName , inputStream , new ObjectMetadata())
					.withCannedAcl(CannedAccessControlList.PublicRead);
		
		s3Client.putObject(putObj);		
		String fileURI = "http://springbkt1.s3.amazonaws.com/" + fileName;
		System.out.println(fileURI);
		return fileURI; 			
		}
}
