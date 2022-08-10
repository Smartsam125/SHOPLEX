/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;


public class product {
    private int productid;
    private  String productName;
    private  double unitPrice;
    private   String imagesource;
    private   String category;
    private    int customerId;
    private  String Description;
    
    public product(){}
    public product(int productid,String productName,double unitPrice,String imagesource,String category,int customerId,String Description){
        this.productid=productid;
        this.category=category;
        this.productName=productName;
        this.unitPrice=unitPrice;
        this.imagesource=imagesource;
        this.customerId=customerId;
        this.Description=Description;
        
                
        
    }
    public void setId(int productid){
        this.productid=productid;
    }
    public int getId(){return productid;}
    public void setCategory(String category){
        this.category=category;
    }
    public String getCategory(){return category;}
    public void setProductName(String productName){
    this.productName=productName;}
    public String getProductName(){return productName;}
    public void setUnitprice(double unitPrice){this.unitPrice=unitPrice;}
    public double getUnitprice(){return unitPrice;}
    public void setImagesource(String imagesource){this.imagesource=imagesource;}
    public String getImagesource(){return imagesource;}
    public void setDescription(String Description){
        this.Description=Description;
    }
    public String getDescription(){
        return Description;
    }
   // @Override
    
//    public String toString(){
//        return "product[id="+productid+",name="+productName+",price="+unitPrice+",image="+imagesource+"]";
//    }
}

