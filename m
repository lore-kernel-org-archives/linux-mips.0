Subject: question regarding put data in the specified section
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 8BIT
Date: Fri, 14 Nov 2003 09:42:34 -0800
Message-ID: <92F2591F460F684C9C309EB0D33256FA01B750B8@trid-mail1.tridentmicro.com>
content-class: urn:content-classes:message
From: "Teresa Tao" <TERESAT@TTI-DM.COM>
Return-Path: <TERESAT@TTI-DM.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20031114174234.B2_REoinX3tVcBVn99huir2J0f4vCHxl0UhCb5mxbD0@z>

Hi there,

Does anyone know how to put my userland program's data in a specified section?

I know there is an attribute "section" to put my data inside a specified section, for example, int data __attribute__ ((section("INITDAT"));
But how do I initialize/setup the INITDAT section? We use the commercial toolchain, and we don't have the source code for it, is there still a way to specify the postion of the INITDAT section?

Thanks in advance!

Teresa
