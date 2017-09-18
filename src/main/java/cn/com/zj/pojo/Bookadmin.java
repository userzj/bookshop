package cn.com.zj.pojo;

public class Bookadmin {
    private String adminuname;

    private String adminpwd;

    public String getAdminuname() {
        return adminuname;
    }

    public void setAdminuname(String adminuname) {
        this.adminuname = adminuname == null ? null : adminuname.trim();
    }

    public String getAdminpwd() {
        return adminpwd;
    }

    public void setAdminpwd(String adminpwd) {
        this.adminpwd = adminpwd == null ? null : adminpwd.trim();
    }
}