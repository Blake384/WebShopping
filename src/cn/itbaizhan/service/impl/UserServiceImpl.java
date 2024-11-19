package cn.itbaizhan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;

import cn.itbaizhan.dao.UserDao;
import cn.itbaizhan.po.User;
import cn.itbaizhan.service.UserService;
//把类交给spring管理(如同配置bean节点)此类受spring事务管理
@Component("userServiceImpl")
public class UserServiceImpl implements UserService {
	//要调用dao层代码,所以要有UserDao的对象，把其实现类靠spring注入
	@Resource(name="userDaoImpl")
	private UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void delete(User user) {
		this.userDao.delete(user);

	}
	public List<User> findAllUsers() {
		return this.userDao.findAllUsers();
	}
	public User findUserById(int id) {
		
		return this.userDao.findUserById(id);
	}

	public void save(User user) {
        // Strong password validation
		if (!user.getPassword().matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$")) {
		    throw new RuntimeException("Password must be at least 8 characters long, " +
		        "contain at least one uppercase letter, one lowercase letter, one digit, " +
		        "and one special character.");
		}

		this.userDao.save(user);

	}


	public void update(User user) {
		this.userDao.update(user);
	}

    public User getUserByLoginNameAndPassword(String username, String password) {
        User user = this.userDao.findUserByName(username);

        if (user == null) {
            throw new RuntimeException("User not found.");
        }

        // Check if account is locked
        if (Boolean.TRUE.equals(user.getIsLocked())) {
            throw new RuntimeException("Account is locked. Please contact support.");
        }

        // Check password
        if (!user.getPassword().equals(password)) {
            // Increment failed attempts
            int failedAttempts = user.getFailedAttempts() + 1;
            user.setFailedAttempts(failedAttempts);

            // Lock account if failed attempts reach limit
            if (failedAttempts >= 3) {
                user.setIsLocked(true);
            }

            // Update user in database
            this.userDao.update(user);

            throw new RuntimeException("Invalid credentials. Account will be locked after 3 failed attempts.");
        }

        // Reset failed attempts on successful login
        user.setFailedAttempts(0);
        this.userDao.update(user);

        return user;
    }

    public void unlockAccount(String username) {
        User user = this.userDao.findUserByName(username);
        if (user != null) {
            user.setIsLocked(false);
            user.setFailedAttempts(0);
            this.userDao.update(user);
        }
    }

	public User findUserByName(String username) {
		
		return this.userDao.findUserByName(username);
	}

	public User queryUser(String username) {
		return this.userDao.queryUser(username);
	}

	public User findUserByinfo(String username, String name, String sex,
			String phone, String post, String address, String email) {
		
		return this.userDao.findUserByinfo(username, name,sex,phone, post, address, email);
	}


}
