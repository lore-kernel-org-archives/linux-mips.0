Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A172F6910;
	Mon,  4 May 2026 20:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777925635; cv=none; b=KcHbTtE5JINtUtZyQs/pIuYllxIKfbYHoJqKxgMcnWlRYdsKFVUYbnttLYWeDNNcKUgpbRuWXiyP7Y1BW09GqbdTweAkw2GCSNWz192ROqkRSThHxyMD/+81XuB/JPEpsvUm9EP3AgV9mKlmDwcYo5k61gB/oj8Rkjynpddc9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777925635; c=relaxed/simple;
	bh=5E7WUVyond/cLXqoj0nvJm4QlWmIL0AsM9YKUAkYs04=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=dzTHQNyxnNl9786OscxripJPoWxTD7IF9VVX20maXS/qIfTyw8DEFPKacywUAe+HG5RjUvRDVoXHGA1spssPPHXQCFXi3gVAigcsDUVr4hrTb4dzc9LlXetS+L3k1tJdo6IMLbX0xLoxHDVqyASBNXl7leZJlYMiWgx5ovYH24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 52FC292009C; Mon,  4 May 2026 22:13:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4431292009B;
	Mon,  4 May 2026 21:13:51 +0100 (BST)
Date: Mon, 4 May 2026 21:13:51 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: DEC: Fix missing platform prototypes
Message-ID: <alpine.DEB.2.21.2605042005080.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

 This set of patches fixes an issue with warnings issued by more recent 
compilers for a bunch of platform functions that are missing prototypes.  
Split into three changes for self-containment.  Please apply.

  Maciej
