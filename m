Received: by wproxy.gmail.com with SMTP id 57so1080468wri
        for <linux-mips@linux-mips.org>; Thu, 23 Jun 2005 15:04:26 -0700 (PDT)
Message-ID: <2db32b72050623150411886bbd@mail.gmail.com>
Date: Thu, 23 Jun 2005 15:04:26 -0700
From: rolf liu <rolfliu@gmail.com>
Reply-To: rolf liu <rolfliu@gmail.com>
Subject: Re: which 2.6 kernel can be run on db1550?
In-Reply-To: <ecb4efd1050623144816f7f528@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
References: <2db32b72050623133731f7b098@mail.gmail.com>
	 <ecb4efd1050623144816f7f528@mail.gmail.com>
Return-Path: <rolfliu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20050623220426.Ua_-diW3EhC7bjhv_EXFRoHTGz09tyq-bmVZgNOZtCs@z>

Thanks very much for the information.

SDE is the toolchain from mips, which is based on gcc 2.96.

I'll try 2.6.11 then


On 6/23/05, Clem Taylor <clem.taylor@gmail.com> wrote:
> On 6/23/05, rolf liu <rolfliu@gmail.com> wrote:
> > I just compiled 2.4.31 and run that on db1550. It works through a NFS
> > root file system. I am thinking of running of 2.6 on db1550.
> 
> I haven't switched over to 2.6.12, but I'm running 2.6.11 (checked out
> from linux-mips on 2005.03.18) on a Au1550 based board. When I was
> porting to my hardware, the default kernel worked just fine on the
> DBAu1550. I'm using gcc 3.4.3 and 2.15.94.0.2.2 bintools.
> 
> > Which one can be compiled by SDE and run this box?
> 
> I'm not sure what SDE is. I used buildroot to compile my toolchain and
> make my root image.
> 
> > I tried 2.6.12 and tried 2.6.12-rc6, but got no luck. They just don't compile.
> 
> I haven't had a chance to try 2.6.12 yet.
> 
>                                --Clem
>
