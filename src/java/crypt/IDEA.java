package crypt;
import java.security.spec.KeySpec;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
import javax.swing.*;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Random ;
 
/**
 *
 * @author dinesh
 */
public class IDEA {
 
    private static final String UNICODE_FORMAT = "UTF8";

    /**
     *
     */
    public static final String algorithm = "DESede";
    private KeySpec myKeySpec;
    private SecretKeyFactory mySecretKeyFactory;
    private Cipher cipher;
    byte[] keyAsBytes;
    private String myEncryptionKey;
    private String myEncryptionScheme;
    SecretKey key;
	String encryptedString = null;
   static byte[] key1=null;
   static byte[] key2=null;
   static String data=null;

    /**
     *
     * @param algorithm
     * @throws Exception
     */
    public IDEA(String algorithm) throws Exception
    {
      algorithm= algorithm;
       }
 
    /**
     * Method To Encrypt The String
     * @return 
     */
	 public static byte[] setSymmetricKey() {
		byte[] knumb=null;
		String knum;
        try {
			Random r = new Random();
			int num = r.nextInt(10000);
			 knum = String.valueOf(num);
            knumb = knum.getBytes();
           // skey=getRawKey(knumb);
            //skeyString = new String(skey);
            //System.out.println("DES Symmetric key = "+skeyString);
			
        }
        catch(Exception e) {
            System.out.println(e);
        }return knumb;
    }
   
    /**
     *
     * @param keys
     * @return
     * @throws Exception
     */
    public static byte[] getRaw(byte[] keys) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance(algorithm);
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        sr.setSeed(keys);
        kgen.init(168,sr);
        SecretKey skey = kgen.generateKey();
        key1=skey.getEncoded();
		System.out.println("key1="+key1);
        return key1;
    }
    
    /**
     *
     * @param unencryptedString
     * @param ky
     * @return
     * @throws Exception
     */
    public String encrypt(String unencryptedString,byte[] ky)throws Exception {
        
		//myEncryptionKey = "ThisIsSecretEncryptionKey";
        myEncryptionScheme =algorithm;
       // keyAsBytes = myEncryptionKey.getBytes(UNICODE_FORMAT);
        myKeySpec = new DESedeKeySpec(ky);
        mySecretKeyFactory = SecretKeyFactory.getInstance(myEncryptionScheme);
        cipher = Cipher.getInstance(myEncryptionScheme);
        key = mySecretKeyFactory.generateSecret(myKeySpec);
        try {
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] plainText = unencryptedString.getBytes(UNICODE_FORMAT);
            byte[] encryptedText = cipher.doFinal(plainText);
			String s=new String(encryptedText);
			//System.out.println("size="+s.length());
            BASE64Encoder base64encoder = new BASE64Encoder();
            encryptedString = base64encoder.encode(encryptedText);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return encryptedString;
    }
    /**
     * Method To Decrypt An Ecrypted String
     * @return 
     */
	 public byte[] getKey(){
return key2;
	 }

    /**
     *
     * @return
     */
    public String getData(){
return encryptedString;
	 }

    /**
     *
     * @param encryptedString
     * @param ky
     * @return
     * @throws Exception
     */
    public String decrypt(String encryptedString,byte[] ky) throws Exception {
        String decryptedText=null;
		myKeySpec = new DESedeKeySpec(ky);
        mySecretKeyFactory = SecretKeyFactory.getInstance(myEncryptionScheme);
        cipher = Cipher.getInstance(myEncryptionScheme);
        key = mySecretKeyFactory.generateSecret(myKeySpec);
        
        try {
            cipher.init(Cipher.DECRYPT_MODE, key);
            BASE64Decoder base64decoder = new BASE64Decoder();
            byte[] encryptedText = base64decoder.decodeBuffer(encryptedString);
            byte[] plainText = cipher.doFinal(encryptedText);
            decryptedText= bytes2String(plainText);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return decryptedText;
    }

    /**
     *
     * @param key2
     */
    public void  setKey(byte[] key2){
	this.key2=key2;
	System.out.print("key="+key1);
                            }

    /**
     *
     * @param data
     */
    public  void setData(String data){

	this.data=data;

}
    /**
     * Returns String From An Array Of Bytes
     */
    private static String bytes2String(byte[] bytes) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i<bytes.length; i++) {
            stringBuffer.append((char) bytes[i]);
        }
        return stringBuffer.toString();
    }
 
    /**
     * <span id="IL_AD10" class="IL_AD">Testing</span> The DESede Encryption And Decryption Technique
     */
    /*public static void main(String args []) throws Exception
    {
        //DESedeEncryption myEncryptor= new DESedeEncryption();
 
        String stringToEncrypt="hai";
        String encrypted=myEncryptor.encrypt(stringToEncrypt);
        String decrypted=myEncryptor.decrypt(encrypted);
 
        System.out.println("String To Encrypt: "+stringToEncrypt);
        System.out.println("Encrypted Value :" + encrypted);
        System.out.println("Decrypted Value :"+decrypted);
 
    }*/
 
}