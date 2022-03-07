/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> getProduct() {
        ArrayList<Product> pro = new ArrayList<>();

        try {
            String sql = "SELECT TOP (1000) [Product_ID]\n"
                    + "      ,[Name]\n"
                    + "      ,[Image_URL]\n"
                    + "      ,[Price]\n"
                    + "      ,[Publisher_ID]\n"
                    + "      ,[Detail]\n"
                    + "      ,[Category_ID]\n"
                    + "      ,[Quantity]\n"
                    + "  FROM [Product]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("Product_ID"));
                p.setName(rs.getString("Name"));
                p.setImgUrl(rs.getString("Image_URL"));
                p.setPrice(rs.getInt("Price"));
                p.setPublisherID(rs.getInt("Publisher_ID"));
                p.setDetail(rs.getString("Detail"));
                p.setCategoryID(rs.getInt("Category_ID"));
                p.setQuantity(rs.getInt("Quantity"));
                pro.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, e);

        }
        return pro;
    }

    public Product getProductByID(int proID) {
        try {
            String sql = "SELECT * FROM [Product] where Product_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, proID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("Product_ID"));
                p.setName(rs.getString("Name"));
                p.setImgUrl(rs.getString("Image_URL"));
                p.setPrice(rs.getInt("Price"));
                p.setPublisherID(rs.getInt("Publisher_ID"));
                p.setDetail(rs.getString("Detail"));
                p.setCategoryID(rs.getInt("Category_ID"));
                p.setQuantity(rs.getInt("Quantity"));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Product> getProductByCategoryID(int categoryID) {
        ArrayList<Product> pro = new ArrayList<>();

        try {
            String sql = "SELECT * FROM [Product] where Category_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("Product_ID"));
                p.setName(rs.getString("Name"));
                p.setImgUrl(rs.getString("Image_URL"));
                p.setPrice(rs.getInt("Price"));
                p.setPublisherID(rs.getInt("Publisher_ID"));
                p.setDetail(rs.getString("Detail"));
                p.setCategoryID(rs.getInt("Category_ID"));
                p.setQuantity(rs.getInt("Quantity"));
                pro.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, e);

        }
        return pro;
    }

    public void updateStock(Product p) {
        {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [Name] = ?, \n"
                    + "      [Price] = ?,\n"
                    + "      [Quantity] = ?\n"
                    + " WHERE Product_ID = ?";
            PreparedStatement stm = null;
            try {
                stm = connection.prepareStatement(sql);
                stm.setString(1, p.getName());
                stm.setInt(2, p.getPrice());
                stm.setInt(3, p.getQuantity());
                stm.setInt(4, p.getProductID());
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                if (stm != null) {
                    try {
                        stm.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }

                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        }
    }

    public void deleteStock(Product p) {
        String sql = "DELETE Product\n"
                + " WHERE [sid] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, p.getProductID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public static void main(String[] args) {
       new ProductDBContext().updateStock(new Product(1, "Son BBIA", 123456, 1000));
    }
}
