From: "=?GB2312?Q?=B9=E3=D0=C7?=" <guangxing@ict.ac.cn>
Subject: How to implement the combination of signal and alarm in the Kenel Module?
Mime-Version: 1.0
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: 8BIT
Date: Mon, 15 Sep 2003 10:27:46 +0800
Message-ID: <20030915022726Z8225387-1272+5432@linux-mips.org>
Return-Path: <guangxing@ict.ac.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.orglinux-mips@linux-mips.org
Message-ID: <20030915022746.IPVmRtjZ9cTViUsXbFJonohwUYOgEBCuPYTseDRKmpA@z>

Hi,everyone!
   As my experience, in the application level we can use  the combination of signal() and alarm() to  
implement some simple works ,such as doing some scheduled task at a certain time, invoke some routine 
after a certain time...Now one thing confused me.I thing in the kernel module we can implement the same works.
And I have tried to use the  queue_task(&Task, &tq_timer),but when i try to "insmod", the LINUX will broken.
Who can tell why?And hoew to implement the combination of signal and alarm in the Kenel Module?
   Thank you in advance!


	

　  廝
宗慎 噪酔
 				

　　　　　　　　鴻佛
　　　　　　　　guangxing@ict.ac.cn
　　　　　　　　　　2003-09-15
