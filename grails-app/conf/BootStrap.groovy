import cn.edu.cup.AppPrefix
import cn.edu.cup.AppRoles

class BootStrap {

    def init = { servletContext ->
        if (AppRoles.count<1) {
            println "AppRoles"
            def appRoles = new AppRoles(name: '一般程序', appRight: '0')
            appRoles.save()
            def bppRoles = new AppRoles(name: '用户程序', appRight: '1')
            bppRoles.save()
        }
        if (AppPrefix.count<1) {
            println "AppPrefix"
            def appPrefix = new AppPrefix(
                prefix: 'http://10.1.16.50:8080/', 
                internetPrefix: 'http://202.204.194.18:8080/',
                alias: 'default')
            appPrefix.save()
        }
    }
    def destroy = {
    }
}
