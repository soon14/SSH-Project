﻿insert into privilege(id,name,url) values(468,'人事管理','/personnelManagment');
insert into role_privilege(roles_id,privileges_id) values(20,468);
insert into privilege(id,name,url,parent_id) values(492,'','/contract_list',468);
insert into privilege(id,name,url,parent_id) values(493,'','/contract_queryList',468);
insert into privilege(id,name,url,parent_id) values(494,'','/contract_addUI',468);
insert into privilege(id,name,url,parent_id) values(495,'','/contract_alertList',468);
insert into privilege(id,name,url,parent_id) values(469,'','/contract_alertUI',468);
insert into privilege(id,name,url,parent_id) values(471,'','/contract_view',468);
insert into privilege(id,name,url,parent_id) values(472,'','/driverLicense_list',468);
insert into privilege(id,name,url,parent_id) values(473,'','/contract_alertFreshList',468);
insert into privilege(id,name,url,parent_id) values(474,'','/driverLicense_freshList',468);
insert into privilege(id,name,url,parent_id) values(475,'','/driverLicense_editUI',468);
insert into privilege(id,name,url,parent_id) values(476,'','/driverLicense_saveUI',468);
insert into privilege(id,name,url,parent_id) values(478,'','/driverLicense_edit',468);
insert into privilege(id,name,url,parent_id) values(479,'','/contract_editUI',468);
insert into privilege(id,name,url,parent_id) values(480,'','/contract_delete',468);
insert into privilege(id,name,url,parent_id) values(481,'','/contract_edit',468);
insert into privilege(id,name,url,parent_id) values(482,'','/contract_add',468);
insert into privilege(id,name,url,parent_id) values(483,'','/contract_freshList',468);
insert into privilege(id,name,url,parent_id) values(484,'','/contract_downloadFile',468);
insert into privilege(id,name,url,parent_id) values(485,'','/contract_deleteFile',468);
insert into privilege(id,name,url,parent_id) values(491,'','/diskFile',468);