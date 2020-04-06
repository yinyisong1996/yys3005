package yys3005.realm;

import yys3005.entity.User;
import yys3005.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.Set;
// self-defined shiro
@Component("customRealm")
public class CustomRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
//        System.out.println(username+"===="+password);
        User dbUser = userService.fingUserByName(username);
//        System.out.println("dbUser======="+dbUser);
        if(dbUser==null || !dbUser.getPassword().equals(password)){
            throw new RuntimeException("Username or password wrong!");
        }
        return new SimpleAuthenticationInfo(username,password,"customRealm");
    }
//  authentication


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        String username = (String) principalCollection.getPrimaryPrincipal();
        Map<String, Set<String>> authMap = userService.findRolesByName(username);
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.setRoles(authMap.get("roles"));
        simpleAuthorizationInfo.setStringPermissions(authMap.get("prems"));
        return simpleAuthorizationInfo;
    }
//    authorization
}
