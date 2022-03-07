/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.rowset.CachedRowSet;
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDBContext extends DBContext {

    public ArrayList<Category> getCategory() {
        ArrayList<Category> cate = new ArrayList<>();
        try {
            String sql = "SELECT TOP (1000) [Category_ID]\n"
                    + "      ,[Name]\n"
                    + "  FROM [Category]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("Category_ID"));
                c.setName(rs.getString("Name"));
                cate.add(c);
            }
        } catch (Exception e) {
        }
        return cate;
    }


    public static void main(String[] args) {
        System.out.println(new CategoryDBContext().getCategory());
    }
}
