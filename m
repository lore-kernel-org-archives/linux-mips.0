Date: Tue, 24 May 2005 16:47:02 +0100
Message-ID: <IH03UE$F4786E1557576A5F497FC95F9CBA3255@scarlet.be>
Subject: Re:Unable to handle kernel paging request at virtual address 04000460
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
From: "Philippe De Swert" <philippedeswert@scarlet.be>
Return-Path: <philippedeswert@scarlet.be>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "raghunathan.venkatesan" <raghunathan.venkatesan@wipro.com>
Cc: linux-mips <linux-mips@linux-mips.org>
Message-ID: <20050524154702.J6VDiUXENW38UaJ4wErPHQkFRHeQBjd3cTbI-OSt9_A@z>

Decode this dump with ksymoops

See here:
http://freshmeat.net/projects/ksymoops/

This will help you discover in which function it is dying, on which offset in
your kernel code etc... Very helpful for debugging. (in 2.6 you can even
compile something alike in the kernel (kallsyms))


---------- Initial header -----------

> We are facing the following crash in custom Linux 2.4.26 kernel, when we
> run a netperf TCP Stream (sizes varying from 64 to 32586 bytes) test
> over an IPSEC tunnel created between a host and a VPN server through our
> box. This is a Au1550 MIPS32 based board (DB1550 Cabernet board from
> AMD). We observe that crash happens randomly (the PrId keeps changing at
> each crash), because of burstiness in the netperf tool generated
> traffic. Please look into the following capture below. I'd like some
> help in debugging this issue. The same set of IPSEC drivers works fine
> on a custom Linux 2.4.25 based kernel. Is there a patch that needs to be
> applied for Linux 2.4.26 ? 
>  
> Unable to handle kernel paging request at virtual address 04000460, epc
> == 802501cc, 8Oops in fault.c::do_page_fault, line 206:
> 
> $0 : 00000000 1000fc00 00000000 00000001 00000000 8b5f61b2 04000460
> 00000000
<SNIP> KERNEL DUMP

CHEERS,

Philippe
 
| Philippe De Swert       
|      
| Stag developer http://stag.mind.be/  
| Emdebian developer: http://www.emdebian.org  
|   
| Please do not send me documents in a closed 
| format.(*.doc,*.xls,*.ppt)    
| Use the open alternatives. (*.pdf,*.ps,*.html,*.txt)    
| http://www.gnu.org/philosophy/no-word-attachments.html  

-------------------------------------------------------
NOTE! My email address is changing to ... @scarlet.be
Please make the necessary changes in your address book. 
