/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Rezwana
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

public class BookController {

    public static boolean saveBname(String bname) {
        Connection conn = null;
        PreparedStatement pst = null;
        boolean t = true;
        try {
            conn = Javaconnect.ConnecrDb();
            pst = conn.prepareStatement("{CALL savebook(?)}");
            pst.setString(1, bname);
            t = pst.execute();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        } finally {
            try {
                conn.close();
                pst.close();
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e);
            }

        }
        return t;

    }

    public static void loadCombo(JComboBox combo) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = Javaconnect.ConnecrDb();
            pst = conn.prepareStatement("{CALL listbook()}");
            pst.execute();
            rs = pst.getResultSet();
            List pList = new ArrayList();
            while (rs.next()) {
                pList.add(rs.getString(1));
            }
            combo.setModel(new DefaultComboBoxModel(pList.toArray()));
            combo.insertItemAt("Select One", 0);
            combo.setSelectedIndex(0);

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        try {
            conn.close();
            rs.close();
            pst.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }

    }

    public static boolean saveIssue(String bname, String price, String date, String qty) {
        Connection conn = null;
        PreparedStatement pst = null;
        boolean t = true;
        try {
            conn = Javaconnect.ConnecrDb();
            pst = conn.prepareStatement("{CALL save_issue(getBookID(?),?,?,?)}");
            pst.setString(1, bname);
            pst.setString(2, price);
            pst.setString(3, date);
            pst.setString(1, qty);
            t = pst.execute();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        } finally {
            try {
                conn.close();
                pst.close();
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e);
            }

        }
        return t;

    }
    public static boolean saveReturn(String bname, String price, String date, String qty) {
        Connection conn = null;
        PreparedStatement pst = null;
        boolean t = true;
        try {
            conn = Javaconnect.ConnecrDb();
            pst = conn.prepareStatement("{CALL save_return(getBookID(?),?,?,?)}");
            pst.setString(1, bname);
            pst.setString(2, price);
            pst.setString(3, date);
            pst.setString(1, qty);
            t = pst.execute();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        } finally {
            try {
                conn.close();
                pst.close();
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e);
            }

        }
        return t;

    }


}
