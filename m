Date: Tue, 19 Jun 2001 20:15:16 +0900
Message-ID: <200106191115.UAA02823@intranet.medialincs.com>
From: =?EUC-KR?B?wba+58iv?=<joey@medialincs.com>
Subject: system freeze when __sti() called 
MIME-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010619111516.wYfcgvUunbTXqORWXXevj60hP67U3DSZ89BElwqoaLQ@z>

hello,
I porting on gt-64120 with R-4700 ..

after linux booting, ERL bit in STATUS register is setted 
so I can't enable interrupt.

I  tried to clear ERL bit but then system was down. 

I use redboot as bootloader. 

have any idea?
