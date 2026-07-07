Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98050430CFC;
	Tue,  7 Jul 2026 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440591; cv=none; b=tzbARy5Fku9jmVeRlHVbfSIkTLYrrJi2CghVJxQAU6jlAV9Y7KibeWAUKCXM4XT6fnJ17ChtszpcL5IRbXkxEcysulW3mBYq3a549qtkJCJQz1XdvGRrK3bJfJl6FH8SS8mmLPLqe7v4a8h9HSOu+nDm0LAjYQ3/guM64WNFUmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440591; c=relaxed/simple;
	bh=iRdSCmbEKFJ45fUdSRwKWBHSo2/YXN0BlmIczrUnKu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmmi6G0wXDM5zeOe3bJPF1QtHJTrsBHMxtWGCrrtKUoc1NKyHHVx0yj9nTatzcq0lNZYL3QrQhNpyLHg/jK3CB1W41o+G6d3jGfrOORwBTAwhsb1rQGhS8DO17hKPZZP/PpvAAH7294tWcfPnHxp3tMc8l0kdJ/yQ1xkRAqY2PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wh8MZ-0002Ih-00; Tue, 07 Jul 2026 18:09:35 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5D883C00E8; Tue,  7 Jul 2026 18:09:09 +0200 (CEST)
Date: Tue, 7 Jul 2026 18:09:09 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Renzo Davoli <renzo@cs.unibo.it>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ptrace: PTRACE_SET_SYSCALL_INFO syscall skipping
 support
Message-ID: <ak0kpcKgV1yFURpW@alpha.franken.de>
References: <20260704142643.692754-1-renzo@cs.unibo.it>
 <20260704142643.692754-2-renzo@cs.unibo.it>
 <akn8g3ya85YFqcjV@cs.unibo.it>
 <akpsTT20F6M2QWND@redhat.com>
 <ak0MykKEi4b6AHRV@cs.unibo.it>
 <ak0jqCyrtFg7azDM@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak0jqCyrtFg7azDM@redhat.com>

On Tue, Jul 07, 2026 at 06:04:56PM +0200, Oleg Nesterov wrote:
> On 07/07, Renzo Davoli wrote:
> >
> > On Sun, Jul 05, 2026 at 04:38:05PM +0200, Oleg Nesterov wrote:
> > > OK, lets only allow the _SECCOMP -> _EXIT transition for now.
> > done in v3.
> > > But will it work on MIPS?
> >
> > IMHO yes, it will (would).
> 
> Agreed, it is not that I think it won't... but it would be nice to have an ACK
> from arch/mips maintainers. syscall_trace_enter() is called from MIPS asm code
> which I obviously can't understand.

I'm looking into it, but spare time short at the moment...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
