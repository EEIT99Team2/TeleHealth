package expendRecord.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import expendRecord.model.ExpendRecordService;

@Controller

public class ExpendRecordController {

	@Autowired
	private ExpendRecordService expendRecordService;
	
	
}
