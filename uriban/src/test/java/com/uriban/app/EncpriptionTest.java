package com.uriban.app;

import java.io.IOException;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.registry.AlgorithmRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


class EncpriptionTest {
	
	  private static final Logger logger = LoggerFactory.getLogger(EncpriptionTest.class);
	  public static void jastypt(String str) {
	        StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
	        
	        encryptor.setAlgorithm("PBEWITHMD5ANDDES");
	        encryptor.setPassword("ourclass_pw");
	        
	        //ADD Salt
	        //saltGenerator를 지정하지 않으면 RandomSaltGenerator를 default로 사용합니다. 
	        //random salt를 사용하는 경우는 암호화된 결과 값이 매번 바뀌므로 권장합니다 
	        //encryptor.setSaltGenerator(new StringFixedSaltGenerator("someFixedSalt"));

	        String encryption = encryptor.encrypt(str);
	        String decryption = encryptor.decrypt(encryption);
	        
	        System.out.println("암호화: " + encryption);
	        System.out.println("복호화: " + decryption);
	    }
	    
	    public static void main(String[] args) throws IOException, InterruptedException {
	        jastypt("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
	        jastypt("jdbc:log4jdbc:oracle:thin:@3.37.96.218:1521:xe");
	        jastypt("ourclass");
	        jastypt("ourclass");
	        //사용 가능한 알고리즘
	        logger.info("allDigestAlgorithms : {}", AlgorithmRegistry.getAllDigestAlgorithms()); 
	        logger.info("allPBEAlgorithms : {}", AlgorithmRegistry.getAllPBEAlgorithms()); 
	    }
}
