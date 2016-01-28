package cn.edu.cup

import cn.edu.cup.AppRoles
import cn.edu.cup.UserApp
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.util.WebUtils

@Transactional(readOnly = true)
class UserAppManagerController {
    
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def showLogs(UserApp userAppInstance) {
        def fileName = "/var/logs/" + userAppInstance.appPath + ".log"
        def log = new File(fileName)
        def logok = log.exists()
        def lines = []
        if (log.exists()) {
            log.eachLine() {e->
                lines.add(e)
            }
        }
        model:[appName: userAppInstance.appPath, fileName: fileName, 
            log: log, logok: logok, lines: lines]
    }
    
    def queryUserApp(params) {
        def normalAppRoles = AppRoles.findByName('用户程序')
        def qa = UserApp.createCriteria();
        def normalAppList = qa.list(params){
            eq('appRoles', normalAppRoles)
        }
        def model = [userAppInstanceList: normalAppList]
        println "----${normalAppList}"
        //----------------------------------------------------------------------
        if (request.xhr) {
            render(template: "userAppView", model: model)   //这是数据
        } else {
            model: model
        }
    }
    
    def queryNormalApp(params) {
        def normalAppRoles = AppRoles.findByName('一般程序')
        def qa = UserApp.createCriteria();
        def normalAppList = qa.list(params){
            eq('appRoles', normalAppRoles)
        }
        def model = [userAppInstanceList: normalAppList]
        println "----${normalAppList}"
        //----------------------------------------------------------------------
        if (request.xhr) {
            render(template: "userAppView", model: model)   //这是数据
        } else {
            model: model
        }
    }
    
    def findCount(name) {
        def qa = UserApp.createCriteria();
        def nc = qa.get{
            projections{
                count("appRoles")
            }
            eq('appRoles', name)
        }
        return nc
    }
    
    def index() {
        /*
         * 获取客户端的IP
         * */
        //def ip = request.getRemoteAddr()
        def ip = request.getHeader("Client-IP")
        println "${ip} -- 1"
        //def ip = 
        if (!ip) {
            request.getHeader("X-Forwarded-For")
            println "${ip} -- 2"
            if (!ip) {
                ip = request.getRemoteAddr()
                println "${ip} -- 3"
            }
        } 
        //----------------------------------------------------------------------
        //程序类型
        def roles = AppRoles.list()
        //----------------------------------------------------------------------
        //每个类型的个数
        def appCount = [:]
        println "${roles}"
        roles.each {it->
            println "${it}"
            def nc = findCount(it.name)
            appCount.put(it.name, nc)
        }
        //----------------------------------------------------------------------
        model:[appCount: appCount, ip: ip, roles: roles]
    }

    @Transactional
    def scanWebApp() {
        def systemApp = ["docs", "examples", "host-manager", "manager", "ROOT"]
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        def servletContext = webUtils.getServletContext()
        def webRootDir = servletContext.getRealPath("/")
        def appName = grails.util.Metadata.current.'app.name'
        def k = webRootDir.indexOf(appName)
        def prefix = AppPrefix.findByAlias('default')
        def roles = AppRoles.findByName('一般程序')
        //def root = webRootDir - appName
        def root = webRootDir.substring(0, k)
        def ip = InetAddress.getLocalHost()
        println "${webRootDir}"
        println "${appName}"
        println "${root}"
        println "${k}"
        println "${ip}"
        println "${roles}"
        def rootFile = new File(root)
        if (rootFile.isDirectory()) {
            //rootFile.eachFileRecurse { file ->  
            rootFile.eachFile { file ->
                def p = file.path
                println "-->${p}" 
                if (file.isDirectory()) {
                    if (!UserApp.findByAppPath(file.name)) {
                        def kk = systemApp.indexOf(file.name)
                        println "${kk}"
                        if (kk<0) {
                            def userApp = new UserApp(appPath: file.name, 
                                appName: '未命名', 
                                appPrefix: prefix,
                                date: new Date(),
                                appRoles: roles
                            )
                            userApp.save()
                        }
                    }
                }
            }
        }
        println "${webRootDir}"
        redirect(action: "index", controller: "userAppManager")
    }
}
