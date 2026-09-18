Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1A352BE34;
	Fri, 18 Sep 2026 21:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765592; cv=none; b=ALnoypnzFTESTmCxXew6/OiEtxKi7MdTzUhmdOO2jxIbs9jwz973wM8/fG4dGBfSPQ8N5oTb/A/sEX5usF545uBMLWImKxuQSQ2A27UeN7OXCva+U3qpMQ0whTNMfJ7KvM/hmEQJJ0WSa17sYrY6fogN9oVkYPILsznopb7AuQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765592; c=relaxed/simple;
	bh=QJOFb8PS7KlovVqbeCI8d5AvnzrFUoX0xV/FBoMmM9s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kn7wWu/E+5xB739gc06TYvO15nRDJE/ig+JWODfwTeDqhkEg6CntW1g+CK4A6/nC4cppfvusEn/5YbyT3M/qvRIdQ5CjrWP2U3OBmpqd+d+/eZmR4+zxIKBQFuSiA6LmKBWv4T9t31CbwB6vCIrGU5nQM0SaV0Sz6jujqxL7wGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 93DBB92009C; Fri, 18 Sep 2026 23:06:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8D36A92009B;
	Fri, 18 Sep 2026 22:06:27 +0100 (BST)
Date: Fri, 18 Sep 2026 22:06:27 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org, 
    linux-mips@vger.kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, zhanjun@uniontech.com
Subject: Re: [PATCH v2 6/6] MIPS: decstation_64_defconfig: Compile the kernel
 with warnings as errors
In-Reply-To: <2AEFB36427BDF18E+20250422102253.137944-6-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2609182205510.57799@angie.orcam.me.uk>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com> <2AEFB36427BDF18E+20250422102253.137944-6-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, WangYuli wrote:

> All compilation issues under decstation_64_defconfig have been
> resolved, and it is now safe to enable CONFIG_WERROR now.

 Thank you.

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej
