Date: Wed, 1 Oct 2003 17:34:26 +0400 (MSD)
From: Tommy Tovbin <tovbin@niisi.msk.ru>
Subject: Re: Problem with depmod 
In-Reply-To: <3680.1065008920@ocs3.intra.ocs.com.au>
Message-ID: <Pine.LNX.4.44.0310011729080.30245-100000@tux.NIISI>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <tovbin@niisi.msk.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Keith Owens <kaos@sgi.com>
Cc: linux-mips@linux-mips.org, raiko@niisi.msk.ru
Message-ID: <20031001133426.fNDZR0K4QkobJNgPOrBjfrPYa-wkb3M5u-wLxH4MN7A@z>

On Wed, 1 Oct 2003, Keith Owens wrote:

> On Wed, 1 Oct 2003 12:18:04 +0400 (MSD), 
> Tommy Tovbin <tovbin@niisi.msk.ru> wrote:
> >
> >Hi, I've recompiled whole RedHat 7.3 on MIPS. Well, when I try to startup 
> >my system I`m getting an error like this:
> >
> >Finding module dependencies:  depmod: cannot read ELF header from 
> >/lib/modules/2.4.18/modules.dep
> 
> Short answer: 'mkdir /lib/modules/2.4.18/kernel' or 'make modules_install'.

> 
> Long answer: You can feed depmod multiple module directories, so depmod
> has to look for directory 'kernel' to work out the top level of each tree.
> modules.dep and the other text files are only ignored at the top level
> of each tree.  You have no 'kernel' directory under /lib/modules/2.4.18
> so depmod does not ignore the text files.
> 
> 
> 

Thanks a lot! 


-- 
With regards, Tommy Tovbin. tovbin at niisi dot msk dot ru.
	Zz
       zZ
    |\ z    _,,,---,,_ /,`.-'`'_ ;-;;,_
   |,4-  ) )-,_..;\ (  `'_'
  '---''(_/--'  `-'\_)
