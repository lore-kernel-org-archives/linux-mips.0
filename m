Received: from blu139-omc1-s5.blu139.hotmail.com ([65.55.175.145]:43675 "EHLO
	blu139-omc1-s5.blu139.hotmail.com") by ftp.linux-mips.org with ESMTP
	id S20027146AbXLFRLy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 6 Dec 2007 17:11:54 +0000
Message-ID: <BLU127-W210887E70121BA9BEA58A78A6F0@phx.gbl>
From: Nathan Eggan <nathan_eggan@live.com>
Subject: Re: Bug in Au1x00 UART or USB drivers for 2.6 kernels?
Date: Thu, 6 Dec 2007 17:11:26 +0000
In-Reply-To: <20071206165100.GP2391@dusktilldawn.nl>
References: <BLU127-W10543A7CB1FFFC1CCC77918A6F0@phx.gbl>
 <20071206165100.GP2391@dusktilldawn.nl>
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <nathan_eggan@live.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips mailing list <linux-mips@linux-mips.org>
Message-ID: <20071206171126.sa8NFBBgRVS9eUnKTwwNNwjxpSGHAnyqplp4fKASf3Y@z>



> 
> ----------------------------------------
> > Date: Thu, 6 Dec 2007 17:51:00 +0100
> > From: freddy@dusktilldawn.nl
> > To: nathan_eggan@live.com
> > CC: linux-mips@linux-mips.org
> > Subject: Re: Bug in Au1x00 UART or USB drivers for 2.6 kernels?
> > 
> > Hi Nathan,
> > 
> > On Thu, Dec 06, 2007 at 04:41:23PM +0000, Nathan Eggan wrote:
> > > Can anyone see this?
> > 
> > Yes, your message came through clearly.
> > 
> > And to reply a little bit more on topic. I had also some strange
> > serial trouble with 2.6.16, but it dissapeared when I used
> > 2.6.23.9. The trouble I had was using 115200bps and for some strange
> > reason bytes would be missing on one of the interfaces. I had no
> > trouble on ttyS2, but ttyS0 would. Strange, but using 2.6.23.9 I
> > did not experience the same problems. I did not investigate the
> > real cause, but just wanted to let you know.
> > 
> > 
> > -- 
> > $ cat ~/.signature
> > Freddy Spierenburg <freddy@dusktilldawn.nl>  http://freddy.snarl.nl/
> > GnuPG: 0x7941D1E1=C948 5851 26D2 FA5C 39F1  E588 6F17 FD5D 7941 D1E1
> > $ # Please read http://www.ietf.org/rfc/rfc2015.txt before complain!
> 
> 
> Thanks Freddy!  It's good to hear you folks can see this.  (I hope you can see this response.  M$'s crappy reply has converted all the original text to HTML escaped charactes.  :( )
> 
> I was reading up on the latest kernel changes you folks are implementing, and I noticed that new IRQ handlers are being coded into 2.6.23 and 2.6.24.  So, perhaps that's the resolution that's required.  I've been in the process of pulling down the latest kernel source and getting it up and running; so perhaps that'll fix everything for me.
> 
> Thanks again.
> Nate
> _________________________________________________________________
> Connect and share in new ways with Windows Live.
> http://www.windowslive.com/connect.html?ocid=TXT_TAGLM_Wave2_newways_112007

_________________________________________________________________
You keep typing, we keep giving. Download Messenger and join the i’m Initiative now.
http://im.live.com/messenger/im/home/?source=TAGLM
