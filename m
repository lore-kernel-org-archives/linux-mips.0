Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191277;
	b=1CXbTb7gfHlnSaFjIbSfIoKYIW9ZGM1exk2lfuR6G2RTd4VEerwUBKgHx9DWKmxDelHz
	 6chHnNoQ5qX5iGfetPJqhnp+NmYrsKcTJazk4lrMTGZF/Jo9K6Jk/ZAf5fSEeoXOLzS59
	 YZxUuEtZF3E4PtR6UenP/yYWTpN76IUF6lTSGPy5aNrDO39+mEcaAU0+bsE8OcxVhnLBg
	 viz/OsDg4Ot0t6ZNe7h61Ci/6o4O/LXsPVSJGEhEsnItjsJvNvZheSHvoI4aUhro4WHut
	 WMd1GPThHhTtUBe7Ts0ATenepJotTBpo9IoqntTtKLYKJX0G81rJlF3Pbasw1s6GBmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191277;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=NzItdHg/6wgPaV8it3SKydxupnW9OzdksKmy/nixS54=;
	b=qyi3tVQURNh9+uorNXirMLqTmIEzAH+sNwMtnCRt7Zza5ZdGQTHN1FC8jtdpSdc2Y03J
	 okFEwrMiU5H/tPA+pLGSxOO0LcZwwD9vD8o9waDft3h6yz+oP3a5bTA2/w8JSGbYcaKjJ
	 TGnj5INRqxAHB6BYdcua9FqmnLV7GpjEEREwSxNTI/Sq1gpjYHe27tw/Bcj4WGd0dnpBr
	 Y3aghryWZXUguyzYvaVrfdQ8g1HnjSo2mHDE+y70w8x1WYBRqxrfqHhqP/bLGuA5jMrST
	 kS09j/y0xHqonqwXQkFAkfZVvIt8dLcIMWve3BTK6SwPjbtqfx6mOKmP3/cuVo0hdkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5C7606A32A;
	Fri, 20 Nov 2026 16:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8C3FD9200BB; Fri, 20 Nov 2026 17:14:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8A0BF9200B3;
	Fri, 20 Nov 2026 16:14:34 +0000 (GMT)
Date: Fri, 20 Nov 2026 16:14:34 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org, 
    Paul Cercueil <paul@crapouillou.net>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Ingenic: Allow assembler reordering in the XBurst
 secondary entry
In-Reply-To: <20261120150035.4ccbad0c@pumpkin>
Message-ID: <alpine.DEB.2.21.2611201547350.54328@angie.orcam.me.uk>
References: <20261120050827.804767-1-f.fainelli@gmail.com> <20261120150035.4ccbad0c@pumpkin>
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

On Fri, 20 Nov 2026, David Laight wrote:

> > Remove .set noreorder and the two explicit delay-slot nops from the
> > XBurst secondary CPU reset entry. GNU as emits identical reset-entry
> > instructions with reordering enabled in both the CI20 and generic
> > MIPS64r2 Ingenic SMP builds.
> 
> If the ordering actually mattered then the fact that the current toolchain
> doesn't break thinks isn't enough to guarantee that a future version
> won't find some way of generating invalid code.

 Nope, unless there is an explicit need to prevent GAS from ensuring that 
pipeline hazards are taken care of user code is expected to use the 
standard `reorder' mode.

 Legitimate examples are scheduling a branch delay slot when there is a 
data dependency (the vast majority of cases, e.g. writing to a register 
the branch reads from) or when you do want to exploit a pipeline hazard 
for some reason (RFE in a branch delay slot comes to mind).

 Otherwise the assembler ensures code semantics as written.  If that is 
not the case, then it is a bug in the tool that needs to be fixed.  You 
can't write code in a specific way "because there may be a bug in a future 
version of a tool that could trigger if I wrote this differently," that's 
ridiculous.

 From experience people tend to use `noreorder' when there's a missed 
optimisation opportunity and they can't be bothered to file a bug against 
GAS.  Or they take code produced by a compiler and tweak it by hand not 
bothering to rewrite it for `reorder' mode.  This has caused real damage 
and hard to chase bugs.

> The explicit nop in the delay slots might even be there because there
> is another reason for the .set noreorder.

 Then `noreorder' blocks are supposed to wrap actual instruction sequences 
that require manual scheduling and not the whole function, and the reason 
for the individual `noreorder' blocks needs to be documented within the 
code.

 Conversely I had to fix code many times when someone used `noreorder' 
needlessly and didn't take pipeline hazards into account of processors 
they didn't care of.  That's just the wrong use of the tool.

 And yes, I did put a lot of effort into GAS to get many missed scheduling 
optimisations fixed.  Most recently over the last weekend, concerning the 
HI/LO accumulator registers.  At worst you'll get an extraneous NOP or a 
couple.  In the vast majority of cases this is not a big deal and in all 
cases it's better than an unsatisfied pipeline hazard.

  Maciej
