import { LightningElement, wire, track } from "lwc";
import getScratchOrgDetails from "@salesforce/apex/ScratchOrgDetails.getScratchOrgDetails";

export default class ScratchOrgDetailsHome extends LightningElement {
  @track
  username;
  password;
  instanceurl;
  edition;
  expirationdate;
  accesstoken;
  alias;
  createdby;
  createddate;
  devhubid;
  recid;
  orgname;
  status;

  @wire(getScratchOrgDetails) contact({ error, data }) {
    if (data) {
      this.record = data;
      this.error = undefined;
      var username;
      var password;
      var instanceurl;
      var edition;
      var expirationdate;
      var accesstoken;
      var alias;
      var createdby;
      var createddate;
      var devhubid;
      var recid;
      var orgname;
      var status;
      this.record.split(/\r?\n/).forEach(function(element) {
        if (element.includes("Username ")) {
          username = element.replace("Username ", "");
        } else if (element.includes("Password ")) {
          password = element.replace("Password ", "");
        } else if (element.includes("Status ")) {
          status = element.replace("Status ", "");
        } else if (element.includes("Instance Url ")) {
          element = element.replace("Instance Url ", "");
          instanceurl = element.replace(".com/", ".com");
        } else if (element.includes("Edition ")) {
          edition = element.replace("Edition ", "");
        } else if (element.includes("Expiration Date ")) {
          element = element.replace("Expiration Date ", "");
          expirationdate = Date.parse(element);
        } else if (element.includes("Created By ")) {
          createdby = element.replace("Created By ", "");
        } else if (element.includes("Created Date ")) {
          element = element.replace("Created Date ", "");
          createddate = Date.parse(element);
        } else if (element.includes("Access Token ")) {
          accesstoken = element.replace("Access Token ", "");
        } else if (element.includes("Dev Hub Id ")) {
          devhubid = element.replace("Dev Hub Id ", "");
        } else if (element.includes("Id ")) {
          recid = element.replace("Id ", "");
        } else if (element.includes("Org Name ")) {
          orgname = element.replace("Org Name ", "");
        } else if (element.includes("Alias ")) {
          alias = element.replace("Alias ", "");
        }
      });
      this.username = username;
      this.password = password;
      this.instanceurl = instanceurl;
      this.edition = edition;
      this.expirationdate = expirationdate;
      this.accesstoken = accesstoken;
      this.alias = alias;
      this.createdby = createdby;
      this.createddate = createddate;
      this.devhubid = devhubid;
      this.recid = recid;
      this.orgname = orgname;
      this.status = status;
    } else if (error) {
      this.error = error;
      this.record = undefined;
    }
  }
}