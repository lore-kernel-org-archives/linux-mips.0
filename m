Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D781C84A2
	for <linux-mips@vger.kernel.org>; Tue,  3 Feb 2026 18:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770143126; cv=none; b=sEv+vK/pITIvpupdhp4yv/7e4FCs5jRStVQCg83cAtzL3ZBfK8y4A2k7bPH1sdwCyA0rTgxD/ZSgttXo4x2MetlCHGhN5eVJXpRw7e/Ez5byTUSiDkwd2yBMMcrIi4FapJWmVPJfcYhkyjqkf/fFB26V+dvcvvSTHLsaAdxy8Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770143126; c=relaxed/simple;
	bh=1ZAG5gFcCmS1cnSfu+2BB2W2CVy1fzwJTnF7UQiPLJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afJTNA3NKH6agG3M+sR+bZmWCnsGJsUAACkHzgh6deh8yr1P/2fvCrMxv3LxadLEoRs87Z0WRvcVw/EzpUQMtXQsJCUpBahBFzDBIikP84Xy8BXMnMBrKRbKTeXUU0oMzpeDnPRZQi8/8m9+9vYqIa00fbYVvegjQL/7JHoWR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=W1Vmzu9c reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="W1Vmzu9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1770143117; bh=1ZAG5gFcCmS1cnSfu+2BB2W2CVy1fzwJTnF7UQiPLJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1Vmzu9cCCJZIKCMCPLIpD/8A7wYBWkYOT4C6vBqqsUqeag0yxtifPCByRX7My/QE
	 mZDcASrglSSmQxNKpsh/+IM60Ar/1sYkZDImytkVcxK2nVMY9JztfHghAfvKPnpYMj
	 JLlit9h6uAeGsdq6HTOZ4xLf9NlcXbas4qH2KOABrFQtvpjkBMePHmB3DpNV6m8fbg
	 BiWd5ZGKw+F/GFl6LCA0AuEtzKi3NnlNpW01+k2phWFdGr+muYIl4Qab0o5Bo1u26z
	 9Fuzomsg+GYU+wyA4UG0iIy2JjS8sEev6XWHRB7NFsDslJdk7QkAVWE+zJvU8zXKLa
	 dzFnKGtE2rsxA==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 801F631E0BA1; Tue, 03 Feb 2026 19:25:17 +0100 (CET)
Date: Tue, 3 Feb 2026 19:25:17 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: serial console on Mikrotik RB532 non-working
Message-ID: <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de>
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de>
 <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
 <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64

Hi Jiaxun,
Jiaxun Yang wrote,
> 
> On Tue, 3 Feb 2026, at 3:24 PM, Jiaxun Yang wrote:
> > On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
> >> Hi MIPS hackers,
> >>
> >> I want to use the latest Linux kernel on my Mikrotik RB532, but the
> >> serial console is non working. I bisected the problem and the first
> >> breaking change is this commit:
> >
> > Hi,
> >
> > Can you try this?
> 
> Oops sorry I missed a flag, it should be:
> 
> diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> index 8ecb56be81ac..239018540221 100644
> --- a/arch/mips/rb532/devices.c
> +++ b/arch/mips/rb532/devices.c
> @@ -213,11 +213,12 @@ static struct platform_device rb532_wdt = {
>  static struct plat_serial8250_port rb532_uart_res[] = {
>         {
>                 .type           = PORT_16550A,
> -               .membase        = (char *)KSEG1ADDR(REGBASE + UART0BASE),
> +               .mapbase        = REGBASE + UART0BASE,
> +               .mapsize        = SZ_4K,
>                 .irq            = UART0_IRQ,
>                 .regshift       = 2,
>                 .iotype         = UPIO_MEM,
> -               .flags          = UPF_BOOT_AUTOCONF,
> +               .flags          = UPF_BOOT_AUTOCONF | UPF_IOREMAP,
>         },
>         {
>                 .flags          = 0,
> 

I tried the patch, but it still hangs here:

RouterBOOT booter 2.18

RouterBoard 532

CPU frequency: 399 MHz
  Memory size:  32 MB

Press any key within 3 seconds to enter setup...
trying dhcp protocol... OK
resolved mac address 9C:BF:0D:00:D6:4E
Gateway: 192.168.1.254
transfer started ........................................ transfer ok, time=525.70s
setting up elf image... OK
jumping to kernel code

Nothing in tcpdump tries to mount nfs, so I believe serial console
breakage is not the only problem here.

Thanks for the help,
 best regards
   Waldemar
