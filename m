Message-ID: <003901c18f76$563c7480$520110ac@roc.com>
From: "Rajesh B. V." <rajeshbv@intotoinc.com>
Subject: Flash File System on MIPS 79S334A Board
Date: Fri, 28 Dec 2001 13:34:54 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20011228080454.B9ExeZlgtsoUFKjv6kKoie2aZ4QJrn6qveWdoTixWkQ@z>

Hi all,
 
 I am using a IDT MIPS 79S334A Board with on board FLASH 'AM29LV320DB'.
 I have to mount file system on this FLASH for my application usage.
 
 I came to know through the linux-mtd site that JFFS can be used for this 
 purpose with a lower layer mtd driver.
 My questions are
 1) Was this chip is already had supporting lower level read/write/erase 
 driver code in the mtd module?
 2) Did anybody used it on MIPS 79S334 board?
 
 Please give me some hooks on how to proceed for this.
 
 while replying please CC to me.
 
 Thanks in advance,
 --Rajesh
