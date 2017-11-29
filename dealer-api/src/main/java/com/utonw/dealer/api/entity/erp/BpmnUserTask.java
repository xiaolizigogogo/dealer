package com.utonw.dealer.api.entity.erp;

/** 
* @author 作者 WT: 
* @version 创建时间：2017年1月22日 下午7:12:57 
* 类说明 
*/
//bpmn文件中userTask标签

public class BpmnUserTask {

		private String id;
		
		private String name;
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		@Override
		public String toString() {
			return "[id=" + id + ", name=" + name + "]";
		}

}
