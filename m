Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AF733032E
	for <linux-mips@vger.kernel.org>; Sat, 21 Feb 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771669714; cv=none; b=IowUwAldwgeSqr+R+NZY03Iz5cSRVu3NV6Uf+PlevMCIprghhgKfTriuJSI0unmj4++7k2e9ELMhiY0RMHJrqTxfhYijWHmNxwhmCelpIpn26uzGXkg/5ZWMG3JTZgz3t0NtIxkEdoWZagp/fOzN3JP6L7h3gQq5R5wtufRxWaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771669714; c=relaxed/simple;
	bh=Fi1k+uOwBDvygui34BAvVp3hq394/jWviFOkEDMo+Nc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YIu98RuWZu1TjRt226KF1taJ4x4p8rfQNpTkok8twDQGIkSyPuhFtnUUFVkoxz7R/BjfrKvzgzVGc1W6+VPNKQRM6Tfnh9iJGaaexCSkIMmkniGXlutgyYf+g5legUwRQcxsv5OiJ8FmFbD85NeuAa5gvtwniwR2tQcArMOUwTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5F17392009C; Sat, 21 Feb 2026 11:28:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5D96392009B;
	Sat, 21 Feb 2026 10:28:25 +0000 (GMT)
Date: Sat, 21 Feb 2026 10:28:25 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Waldemar Brodkorb <wbx@openadk.org>
cc: Rong Zhang <rongrong@oss.cipunited.com>, 
    Jonas Gorski <jonas.gorski@gmail.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    Rong Zhang <i@rong.moe>
Subject: Re: serial console on Mikrotik RB532 non-working
In-Reply-To: <aZl5fBs9L5zV7fSD@waldemar-brodkorb.de>
Message-ID: <alpine.DEB.2.21.2602211020130.3233@angie.orcam.me.uk>
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de> <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com> <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com> <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de> <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com>
 <aYMrN3EhBM0Ip7b3@waldemar-brodkorb.de> <CAOiHx=nJN9suqTV7XfuTmO1X9QZv0wn=VqwkEzGmPctAF09v9Q@mail.gmail.com> <aYN1_mED5-IiKC4E@waldemar-brodkorb.de> <c80062a1b781ff256426d659ab327654174177d1.camel@oss.cipunited.com> <aYRG2p4PX-oELYhU@waldemar-brodkorb.de>
 <aZl5fBs9L5zV7fSD@waldemar-brodkorb.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 21 Feb 2026, Waldemar Brodkorb wrote:

> just for your information. This commit also breaks bootup of
> Microchip PIC32MZ Graphics (DA) Starter Kit.

 I'm working on a fix, but it's a tough issue, because at kernel entry we 
don't know the state of the TLB and the existence/activation of the hidden 
TLB "entry disable" bit can't be determined (in which case we could just 
proceed to the final initialisation).  I should have something in the next 
week or so, but in the meanwhile please just revert the commits that 
affect your particular configuration.

  Maciej
