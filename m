Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C422330328;
	Sat, 28 Mar 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712997; cv=none; b=bOokxTji1Tc4YQgbfxE7SiR7x3zQz+UU6uJAYaeUorD48Y6xbZS6/25V9NOFVSUInFXPGKiuTWsmbvx4OiQzUFaq5lWOPxZ/PPoC+tSkuuTwzDqzNQ9EpYAcBE14MBgQz6LWy2RfbTbfxYtTEoeicQbskV5RZHuQNnTt9xsWjmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712997; c=relaxed/simple;
	bh=W5wGDdzMXd3xpIOGIuK3qV2UEqdEtENwukdDZArEZAs=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=PPLh8Nmf1W5e7E19IDkQeRI0bDW7yqcPGApuyU1/Dejc48skgfh+Fb8DtTWtM9aRT/BDKhyK+aec8niPTc5wH5SOLi6Tlacc//lDsbP2v6e+eQVAZvEg9RsMZEUV92VhShZCYjw7ft3/faKOr3gby0vvhbdCX121paN6n49ss+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 048AB92009C; Sat, 28 Mar 2026 16:49:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0331592009B;
	Sat, 28 Mar 2026 15:49:52 +0000 (GMT)
Date: Sat, 28 Mar 2026 15:49:52 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: DEC: Rate-limit memory errors
Message-ID: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

 A recent failure of one of my systems revealed an issue with memory error 
logging where the flood of messages produced, which reported corrected ECC 
errors, made the system unusable despite the errors themselves having been 
recovered from and the messages serving informational purpose only.

 I took the opportunity and actually verified the rate-limiting does its 
purpose with the offending system before cleaning memory module contacts, 
which has cured the original problem, the third time in ~25 years I've had 
the system for -- not too bad, but clearly a recurring issue.

 For consistency I have also updated support for the other two DEC memory 
system designs, although they're parity-based and therefore memory errors 
are fatal and consequently less likely to cause a message flood, although 
in principle still possible where a faulty memory location causes a bus 
error exception to kill user processes repeatedly.  They seem not to have 
the issue with memory contacts though, which use the common SIMM design 
rather than 0.1"-pitch PCB connectors.

 Please apply.

  Maciej
