content-class: urn:content-classes:message
Subject: question regarding bss section
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 8BIT
Date: Mon, 27 Oct 2003 09:44:05 -0800
Message-ID: <92F2591F460F684C9C309EB0D33256FA01B750B3@trid-mail1.tridentmicro.com>
From: "Teresa Tao" <TERESAT@TTI-DM.COM>
Return-Path: <TERESAT@TTI-DM.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20031027174405.MBb3r1Ua_qa1hWlgcP3DOEdqZrTDJouA3z5srYQTlbQ@z>

Hi there,

I have several questions and hope somebody could help me with the answers:
1. how to use gcc to compile the user mode program with larger stack size?
2. Inside the user mode program, I have declared some gloabal data which is being put on the bss section and I would like to know whom initialize the bss section? How big is the bss section? Under what kind of situation, the bss section data could be corrupted?
3. What's the difference to compile the program with -G 0 option? That menas I don't use the $gp register, will there be any side effect?

Thanks in advance!

Teresa
