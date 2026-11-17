Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934982;
	b=KNkDaG1SCAp/F/iu5t7KkzbE4PXev59tUg93bJ6B0oegrx/CMam5ZHCPmAMzir1N26Fj
	 REZi91ZbN/PF98cd8wxw0JUZuaKYHomiwDgj0Y35ULlRxisuvyJooJ3ya5z6zNEi8zSC8
	 0Ui1duljn3bVfavZfim3de7emSRgwnIYPX4uJeh6u8NQd49XPAAbYpn6Ga+dG+pbxFI0C
	 Zu4/VV09QXo7kqvtmNn8Ydk3DWAGxDiE1qPsNOwRx+ZmZttHTJJmr5aPhpdiZE1AVocTK
	 pLtDTYEAwvNoRwFuwnZCtWvUE66coV6jUm3Q6CrdpRIubyNXjks8UAYAbsLZ5vrnv0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934982;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X4RkNEce5DxulKJ8PQAKKgnKeRYyeSstV0Z+RG/FOSs=;
	b=WzG70lm07S1jfqNTqUkBB+VZW356XgHln/mCUi8+SsrjjX3/2KySiqU5cyFm0QjV9kwm
	 BG852kI9Fubmf7loHIQF50t4xL9prWJORzMnxn8FGvecBEx318IjfCmFE7sxwumMxWGZI
	 qYZQkU0TMY0Qjhk6/16yFQLrB+oid+isBIqGTRwJi7Npov0TTdWfLlranQH1R52SVR44r
	 3eoCVkGpU4VyCSFM8GUEFSnUlThUypyTHf5PJI5+1zKFL4F1XF0p/kBoOKnDvp3+h8fji
	 C74gGW7eaS71ULQM6CyljYtJb9enWJN2dNlZq1hN/Av6Xl/ZPzwd6EPFCkSqvMVqUug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48014606A31C;
	Tue, 17 Nov 2026 17:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48014606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTMaC-0005GJ-00; Tue, 17 Nov 2026 18:03:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A49C4C0520; Tue, 17 Nov 2026 17:56:14 +0100 (CET)
Date: Tue, 17 Nov 2026 17:56:14 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] MIPS: sgi-ip32: Reserve the firmware memory
Message-ID: <avyHLu4-jaWCSuut@alpha.franken.de>
References: <20261013094554.16804-1-kaloz@kernel.org>
 <20261013094554.16804-3-kaloz@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013094554.16804-3-kaloz@kernel.org>

On Tue, Oct 13, 2026 at 11:45:53AM +0200, Imre Kaloz wrote:
> ARC memory descriptors are ignored on IP32, so firmware data in low
> memory ends up in the page allocator and CMA. Reserve it using the
> generic ARC walk; RAM comes from CRIME, as ARC lists only the first
> 256 MiB.
> 
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  arch/mips/fw/arc/memory.c        | 11 +++++++++--
>  arch/mips/include/asm/sgialib.h  |  3 +++
>  arch/mips/sgi-ip32/ip32-memory.c |  3 +++
>  3 files changed, 15 insertions(+), 2 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
