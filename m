Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB993DA7D4;
	Mon,  9 Mar 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071032; cv=none; b=FRw4BUOBSNqi6WZ7KHOEFMn6eu+UC3gfiNedGdAO0+9KQX9Z9Bpgho3dfSYySzRJhCXSB0PQhbK3TrbVnfRf51whfhqUgQneA9Mza8VriDNBvJ1xWRGeGtrTN/lQL2/FmGc41QZZgUisgDZUEMNdrd2Q+aQsBHPOK5pqZ2rM48s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071032; c=relaxed/simple;
	bh=NMNcJ682tG9GUd1fgRwHm8EUYrb3fDzsi5Em8LwJ3iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaoRc3yPv5MXSohhiDsFNi6QJCz1Wq/gblu3QKn0q7VFbgCfIPiW8xtHeZ6M45CxHKI5Z5/fDsjaYvaR1G9nlaIzU0w8YKAHbxwv/POKD+t1uyeHaO1TuG5s4swGz6MUhxFrwVMoG10jm0r4nR1f3jb1fpnvwWjjMygv9pZJ6rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RsV/doi6; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RsV/doi6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 52F5340E019E;
	Mon,  9 Mar 2026 15:43:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ckCb_2pEfPyL; Mon,  9 Mar 2026 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773071022; bh=HLskXEdwlJkuTToxcENiAiE6qyUWy5ccxv40iT5qOes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsV/doi6+xj0uyTiVGZqaeoKXJmnQ8M46TooCglsBJHFQkESGFlzyuOzjQ4bil6l+
	 VUIkdn6a7OymnOQ6QphUwDjbSrFyeO6jR+Trfppzvk2icoVuGR+Z/MaardXeNgQ+jv
	 Emfc2SqztK0kiXeRj3Wc7Hwzmr3k/+TwRLT/riAXo5dP6UlnsyO79w2BUY9XwBRLu6
	 5PRahVXmKKoyxNS4oSzP4BpazZFOAcVSNJ1sYVnwj5jiAA1UQFx0Si4qfr0ugjnJSt
	 OiKVSFDObJpLO+wslp53LoMGmIYEe3nusdoqADyCjTfo2byLN68nOPbvUGH5shYbVl
	 Xup7bR6mW7+vBlh9xqkS7Hh4UxDM7YcCvtBU9kW20MQ+GYmQPyqGVIeX5jAXgc0TMS
	 UvwiPdX+ZvebXrcyJcLa0Eqy2zfOWQBAkML4kW0FFIafJ5ZwiKsEswZW6h1jbssoZB
	 9IqNT6qsutcfzP4cVg07L8AabEbNuGJBxOv1sq7KWv/y1VtC4INTzRpfeMffdzXmTp
	 Hxn3Fb3ZtzU2la2FTNa8e373nuqFeuzogF92jnb5BPj+shc38ELXWJBK0G4tpkWzbS
	 CJjLq3Z3U/kf9Azfc9wDr6O8cPIogikK740D2yI9zniYSVBDANFR7fJHp7M2oEz3k1
	 fNW6LiyF1T/KknzOx3oGZ+mo=
Received: from zn.tnic (pd9530d5e.dip0.t-ipconnect.de [217.83.13.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 8D06840E01A8;
	Mon,  9 Mar 2026 15:43:25 +0000 (UTC)
Date: Mon, 9 Mar 2026 16:43:17 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Jiri Wiesner <jwiesner@suse.de>,
	Daniel J Blueman <daniel@quora.org>,
	Scott Hamilton <scott.hamilton@eviden.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
Message-ID: <20260309154317.GPaa7qlRzYcQY1dBU3@fat_crate.local>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123231521.926490888@kernel.org>

On Sat, Jan 24, 2026 at 12:18:01AM +0100, Thomas Gleixner wrote:

Patch 2 and 4 should say "Don't" in the subject title. :)

> The clocksource watchdog code has over time reached the state of an
> unpenetrable maze of duct tape and staples. The original design, which was

"impenetrable"

> made in the context of systems far smaller than today, is based on the
> assumption that the to be monitored clocksource (TSC) can be trivially
> compared against a known to be stable clocksource (HPET/ACPI-PM timer).
> 
> Over the years it turned out that this approach has major flaws:
> 
>   - Long delays between watchdog invocations can result in wrap arounds
>     of the reference clocksource
> 
>   - Scalability of the reference clocksource readout can degrade on large
>     multi-socket systems due to interconnect congestion
> 
> This was addressed with various heuristics which degraded the accurracy of

"accuracy"

But those are just nitpicks.

The overall thing sounds good to me, I haven't done any indepth review but
from a cursory look, it looks nice.

Testing looks good too on one machine so

Tested-by: Borislav Petkov (AMD) <bp@alien8.de>

I say, let's queue it now so that it can get wider testing.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
