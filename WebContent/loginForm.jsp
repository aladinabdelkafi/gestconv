<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml"
    	xmlns:h="http://java.sun.com/jsf/html"
    	xmlns:f="http://java.sun.com/jsf/core"
        xmlns:t="http://myfaces.apache.org/tomahawk">
<%--@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"--%>
<%--@ taglib uri="http://java.sun.com/jsf/html" prefix="h"--%>
<%--@ taglib uri="http://java.sun.com/jsf/core" prefix="f"--%>

<f:view>
  <h:form>
  <h:outputText value ="Authentification"/><br><hr>
  <h:panelGrid columns ="2">
     <h:outputText value="Login :"/> 
     <h:inputText value="#{loginBean.username}"/> 
     <h:outputText value="Mot de passe :"/> 
     <h:inputSecret value="#{loginBean.password}"/> 
  </h:panelGrid>
  <h:commandButton value="Connecter" action="#{loginBean.login}"/>
  </h:form>
</f:view>