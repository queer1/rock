package de.dewarim.rock

import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class PortalController {


    def index() { }
}
