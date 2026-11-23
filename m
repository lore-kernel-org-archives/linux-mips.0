Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433534;
	b=1kTY7hpeWbL3HasAuNRfF3YCdW73OdEmpBFr8QB2Rp2FleZLYGOYhudYiYehVJEuNXY/
	 j7DJhN6JFVNCtvIolfS8ErDlTmh+AXomunMekkTuXTiNzb/WrRnZyMkJIE4uBwZVzJNR5
	 WVmwz2VDDTDFNPffwxqS+6rNosSmZW6Axdy4H8swWX2ONV73WxHBKGPxnAOYHwgW8HEIo
	 0MWlAkO+21X9BX0Ybr4c6YNsEccimFGgA45AuxYPxv/eOYGerfR4Ebrfv9WRMX4O+dByB
	 HzrsybnQSF5JArtQlJazM7Jl6HuzJWDIZQTx4HPXkX5EGBjSW2SvaM74ziag4fPbVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433534;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=vfzFJWaw7PJvBRx+8xQqvVVl0Wwzfhc/VvgCroXjFb4=;
	b=kRSWA8O/tebUGvL74vFPn5BTS9AV69OZi6myMU3Xm4wM1kG4DbaxmkYjcxSEpjjOYl5a
	 z87iVg7/xq6ldu0SyyZ1YZJwOnTVGTZoiyYYd7zSuyZJBcq/bWNZPXuxVxTt5+0CL1oTI
	 A2btVXf4eIdAdKDXrwfcOcS28QRwyTkaIFaUj+a+yDoHv0YgRG1A48RvYTF3bcYiogPO/
	 RCBZKTbeud6fKT8CwTqqyk1mGSwmrYwayZIaxK3mZk6awv3IZwHwffhiFeccjdmFzlLcy
	 M/PzLVb3pVM5A65yWvHDYd+nRP++2UPrLbXeIHzMGQEU9WAtiZEANXUJYmJhi3lf9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372A7606A31A;
	Mon, 23 Nov 2026 11:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 372A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 28B609200B3; Mon, 23 Nov 2026 12:32:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2397592009D;
	Mon, 23 Nov 2026 11:32:05 +0000 (GMT)
Date: Mon, 23 Nov 2026 11:32:05 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Tzu-Ching Yang <shingekinocore@gmail.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
    Yury Norov <yury.norov@gmail.com>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
    =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6
 kernels
In-Reply-To: <20261123035732.728281-1-shingekinocore@gmail.com>
Message-ID: <alpine.DEB.2.21.2611231038330.54328@angie.orcam.me.uk>
References: <20261030140430.1857741-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk> <20261123035732.728281-1-shingekinocore@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2026, Tzu-Ching Yang wrote:

> >  Umm, the wrong fix.  You want __isa_ge_or_flag() instead, plus obviously
> > `cpu_has_64bits' is also needed (and __isa_ge_and_flag() can be discarded;
> > I guess it was meant to take care of what `cpu_has_64bits' does and broke
> > the whole idea by mistake).
> 
> Your form and v1 differ only on pre-r6 kernels. I built both on

 Then you're doing something wrong; with __isa_ge_or_flag() I get:

$ file vmlinux-*
vmlinux-base:         ELF 64-bit LSB executable, MIPS, MIPS64 rel6 version 1 (SYSV), statically linked, BuildID[sha1]=10726d48319f6e095188c715586014d94687e241, with debug_info, not stripped
vmlinux-has-mips64r6: ELF 64-bit LSB executable, MIPS, MIPS64 rel6 version 1 (SYSV), statically linked, BuildID[sha1]=01be340ec78999c55ac60d8f51c0a4a5fdfcbb2e, with debug_info, not stripped
$ size --format=gnu vmlinux-*
      text       data        bss      total filename
  11145180    3682690     301824   15129694 vmlinux-base
  11072380    3686698     301824   15060902 vmlinux-has-mips64r6
$ objdump -d vmlinux-base | grep -c dclz
18
$ objdump -d vmlinux-has-mips64r6 | grep -c dclz
1430
$ 

(the former figure being nonzero is owing to the compiler being able to 
produce DCLZ from RTL; the rest is our inline assembly stuff).

> > Your proposal precludes the use of R6 stuff
> > with pre-R6 compilations -- not sure if that makes sense, but let's stay
> > consistent with these macro definitions.
> 
> In mainline cpu_has_mips64r6 is already 0 on pre-r6 kernels, and I do
> not think a pre-r6 kernel gets as far as cpu_probe() on an r6 CPU.

 That's what we do for MIPS32r6 though, so doing the same for MIPS64r6 
will be consistent.

> The comment above __isa_ge_and_ase() in cpu-features.h says that
> "a kernel built for an older ISA cannot run on a MIPSr6 CPU", and
> under QEMU -cpu I6400 (an r6 CPU) a 64-bit malta kernel built for r2
> takes a Reserved Instruction exception at the first jr in head.S.

 Regrettable, but even more so __isa_ge_and_flag() doesn't make sense, 
since ISA will always match FLAG at run time.

 FWIW an early check for the ISA mismatch might be worth having if at all 
feasible, reporting the issue via a firmware printf()-like callback where 
available.  Said JR instruction could be recoded as JALR $0, ... if this 
turns out feasible.  Not a requirement for your change of course.

> That leaves three ways, and I will send whichever you prefer as v2:
> 
> 1. v1 with the unused __isa_ge_and_flag() removed, and in the same
>    series a patch that defines cpu_has_mips32r6 as (MIPS_ISA_REV >= 6)
>    to match, like cpu_has_mips_1 (MIPS_ISA_REV < 6) in that header.
>    cpu_has_mips_r6 is then 0 on pre-r6 kernels and the code that it
>    guards is dropped: in bloat-o-meter -t, -11524 bytes for
>    64r2el_defconfig and -11156 for 32r2el_defconfig with GCC 16.2,
>    -18704 and -14140 with Clang 23, with no new W=1 warnings in these
>    vmlinux builds. r6 kernels stay byte-identical to v1.
> 2. v1 with __isa_ge_and_flag() removed: pre-r6 kernels do not change.
> 3. Your form, with the sizes above.

 I maintain that __isa_ge_or_flag() is the correct approach.

  Maciej
