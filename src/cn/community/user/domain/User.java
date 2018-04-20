package cn.community.user.domain;

public class User {

	// 对应数据库的表
	private String uid;
	private String loginname;
	private String loginpass;
	private String email;
	private boolean status;// 状态，true表示已激活，或者未激活
	private String activationCode;// 验证码，它是唯一值，即每个用户的激活码是不一样的，可用uuid来实现
	private String verifyCode;// 验证码

	// 修改密码表单
	private String newPass;// 新密码

	// 对应注册表单
	private String reloginpass;// 确认密码；

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpass() {
		return loginpass;
	}

	public void setLoginpass(String loginpass) {
		this.loginpass = loginpass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	public String getReloginpass() {
		return reloginpass;
	}

	public void setReloginpass(String reloginpass) {
		this.reloginpass = reloginpass;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", loginname=" + loginname + ", loginpass="
				+ loginpass + ", email=" + email + ", status=" + status
				+ ", activationCode=" + activationCode + ", verifyCode="
				+ verifyCode + ", newPass=" + newPass + ", reloginpass="
				+ reloginpass + "]";
	}

}
