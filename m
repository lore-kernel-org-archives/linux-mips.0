Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B631D4D8DAA;
	Tue, 21 Jul 2026 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646322; cv=none; b=cN9fjCHfwuI0IqHTTYRV6WmQ/hmABInk8eDp/a9yG+KZrWbLGwH3TcomRKHVoSvChQGOp1fBtKFIsCjpBftuZbOYuy5xqRsTYhR4KEAKKKukZYPO7JtHmpWv6SAe7pU4WiuLtS40cI1zDXC8/Gle33/SVJzsUmTWKbNtNkgzfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646322; c=relaxed/simple;
	bh=C2R2VrWGOBAKH0Wl9GEmBS5KM46mNhDNbuQAmAKeCd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUcW1WIVsrM2nFDJ0Cp5SBZ/Yy5GVPbDo2BLZeefbIwNPpzljsIz1Sllvq/8ej+bQ/XakfN9Wi4PnFdcuLEJcCAYHp3wQlDw4ZBmUy5+NNOyzdbOoB9Y1dJZDdldAhVEVDGo4UlCUJH2R99mVK051T+rII0JKYVwt3Jf6Zdcg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wmC1u-0006EH-00; Tue, 21 Jul 2026 17:05:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 85BCDC00E8; Tue, 21 Jul 2026 17:04:34 +0200 (CEST)
Date: Tue, 21 Jul 2026 17:04:34 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>
Cc: Oleg Nesterov <oleg@redhat.com>, James Hogan <jhogan@kernel.org>,
	Kees Cook <kees@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: ptrace: Fix syscall skipping via PTRACE_SYSCALL
Message-ID: <al-KglT33I2jzUC7@alpha.franken.de>
References: <20260717112731.59254-1-tsbogend@alpha.franken.de>
 <27072da0-124d-4a87-b037-f56320c8e97b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27072da0-124d-4a87-b037-f56320c8e97b@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 04:43:40PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> +Jiaxun
> 
> On 17/7/26 13:27, Thomas Bogendoerfer wrote:
> > If tracer wanted to skip a syscall return value was always
> > overwritten with -ENOSYS. Fix this by checking against original
> > syscall number and only return -ENOSYS, if it is negative.
> > 
> > Fixes: b6318a903d06 ("MIPS/ptrace: Pick up ptrace/seccomp changed syscalls")
> 
> I think you meant:
> 
> Fixes: 4370b673ccf2 ("MIPS: scall: Save thread_info.syscall unconditionally
> on entry")

no it was already broken before that commit.

b6318a903d06 reloads syscall number after tracehook_report_syscall_entry() so
the check for negative syscall is done with the "manipulated" syscall number.
And it the syscall should be skipped that number is -1.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
