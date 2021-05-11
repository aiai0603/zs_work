package com.example.demo.controller;

import com.example.demo.dao.AdminDao;
import com.example.demo.dao.SysRoleDao;
import com.example.demo.entity.Admin;
import com.example.demo.entity.SysRole;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private SysRoleDao sysRoleDao;

    @RequestMapping("/list")
    @RequiresPermissions("admin:view")
    public ModelAndView userInfo(@RequestParam(value = "start", defaultValue = "0") Integer start,
                                 @RequestParam(value = "limit", defaultValue = "5") Integer limit) {
        start = start < 0 ? 0 : start;
        Sort sort = Sort.by(Sort.Order.desc("uid"));
        Pageable pageable =PageRequest.of(start, limit);

        Page<Admin> page = adminDao.findAll(pageable);

        Admin adminprincipal = (Admin) SecurityUtils.getSubject().getPrincipal();

        ModelAndView modelAndView = new ModelAndView("list");
        modelAndView.addObject("page", page);
        modelAndView.addObject("name", adminprincipal.getName());
        modelAndView.addObject("Username", adminprincipal.getUsername());
        modelAndView.addObject("RoleList", adminprincipal.getRoleList());
        return modelAndView;
    }

    @RequestMapping("/addtest")

   @RequiresPermissions("admin:add")
    public String adminAdd(String name, String password, String role) {
        Admin admin = new Admin();

        int hashIterations = 2;

        Object salt = "longyan";

        Object credentials = "123456";

        String hashAlgorithmName = "MD5";
        Object simpleHash = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
        admin.setUsername("long2");
        admin.setPassword(simpleHash.toString());
        admin.setSalt("yan");
        admin.setPassword(simpleHash.toString());
        List<SysRole> roles = new ArrayList<>();
        SysRole role1 = sysRoleDao.findByRole("admin");
        roles.add(role1);
        admin.setRoleList(roles);
        adminDao.save(admin);
        return "Add";
    }

    @RequestMapping("/add")
    @RequiresPermissions("admin:add")
    public String adminAdd() {
        return "Add";
    }

    @RequestMapping("/del")
    @RequiresPermissions("admin:del")//权限管理;
    public String adminDel() {
        return "Del";
    }
}