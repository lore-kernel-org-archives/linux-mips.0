From: "Y.H. Ku" <iskoo@ms45.hinet.net>
Subject: RE: BootLoader on MIPS
Date: Wed, 27 Mar 2002 20:14:38 +0800
Message-ID: <NGBBILOAMLLIJMLIOCADCEOKCCAA.iskoo@ms45.hinet.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
In-Reply-To: <3CA0B924.2030003@mvista.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020327121438.PHrwpMd9A1bjC34ri6Y74DN9DYyTnHRgMqtAIf2feHo@z>

Thanks All!!!!

What I want to know is how PMON jump to linux kernel image,

when mips.S function "_go" execute "j k0" command, 
(k0 is assigned by LREG(k0,R_EPC,gp)  /* EPC */)
k0 will be 40*(DBGREG)=40* (0x7ff00bad), 

the address is kuseg's domain. is it really work to turnin linux kernel image??
(In common case, linux kernl image always start from 0x100000)

any suggestion?
I just want to know MORE about the LINK method between PMON and MIPS-Linux?

best regards,
--Ku
