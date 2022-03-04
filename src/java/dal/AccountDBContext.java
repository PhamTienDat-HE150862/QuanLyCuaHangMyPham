package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;
import model.Account;

public class AccountDBContext extends DBContext {

    public boolean checkExits(String username, String password) {
        try {
            String sql = "select username, password from Account WHERE username = ? AND password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Account> getAcc() {
        ArrayList<Account> acc = new ArrayList<>();
        try {
            String sql = "SELECT UserName, Password  FROM Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString("UserName"));
                a.setPassword(rs.getString("Password"));
                acc.add(a);
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return acc;
    }

    public void insertAccount(Account a) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([UserName]\n"
                + "           ,[Password]\n"
                + "           ,[Status]\n"
                + "           ,[Role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, a.getUsername());
            stm.setString(2, a.getPassword());
            stm.setString(3, a.getStatus());
            stm.setInt(4, a.getRole());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public boolean CheckUserName(String username) {
        try {
            String sql = "select username from account where username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public Account getAccountByName(String name) {
        try {
            String sql = "select * from Account where UserName = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {         
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
            }
        } catch (Exception e) {
                        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, e);

        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new AccountDBContext().getAccountByName("mra"));
    }

  

}
