From: "Guangxing Zhang" <guangxing@ict.ac.cn>
Subject: help, question on pci communication!
Mime-Version: 1.0
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: 8BIT
Date: Wed, 24 Sep 2003 16:29:32 +0800
Message-ID: <20030924082911Z8225460-1272+6248@linux-mips.org>
Return-Path: <guangxing@ict.ac.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Fuxin Zhang <fxzhang@ict.ac.cn>
Cc: linux-mips@linux-mips.orglinux-mips@linux-mips.org, angela <jhyang@ict.ac.cn>
Message-ID: <20030924082932.OyojVsw5_HuKO1ZdarAXXlraKlrZErVThA9jZXDj49s@z>

Hi, Fuxin and everyone see this mail,
    In linux world ,newbies always like to ask and the veterans will always be enthusiastic.:)~~
    Now there is a "ask", of course i am a newbie. 
    Follow is the  architecture  which we are working on.
    Now i want to transfer the data from the "sb1250" to mcp750 through the PCI bus with the help of 21555 bridge.
I want to implement it in kernel module.Although knowing "use the force ,read source",but i really do not know
how and where to begin.
    Is there any advice on it ? How to implement the communication through PCI (or PCI-to-PCI bridge) in kernel 
moudle?
    Any help will be appreciated!Thank in advance!
  
                      -------------
	                  |  MCP 750  |  (Power PC)
                      -------------
                            |
　	    -------------------------------------------CPCI
                         |
             ---------------|--------------------------------    
             |      --------|-----                         |
             |      |Intel 21555 |(PCI-TO-PCI Bridge)      |
             |      --------------                         |
             |        |                					   |	
             |      --------(PCI bus)					   |
			 |          |                                  |
			 |       --------                              |
			 |		 |SB1250|(CPU)                         |
			 |       --------                              |
             ----------------------------------------------           
　　　　　　　　Guangxing Zhang
　　　　　　　　guangxing@ict.ac.cn
			    2003-09-24 16:03:04
　　　　　　　　　　
