Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE05E275848;
	Thu, 14 May 2026 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775485; cv=none; b=bdgdZin5OAiUG0+ZK9LE+l1cLiRLaadWbJBtYuJsHEGZsFGhoDpOmXdBiXpqYbK4p7C0T2yabUjYEyF9DKLdm3TLGZTW+xV2mWMb8HIrd4MdpozJUoCnlyyWJqLBoEtu1Bv4lzTqQvLDre5v6lzUyJvhrQH+kfxuo1Fi8K6CXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775485; c=relaxed/simple;
	bh=/g4jFjZPiFSrClQIiaJoDlvUPxodjYT6LCU7ijnm8BM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X0lW3Wd6sl13+SWqkv9HuMKZpPYudrmO1tJfiQyyMd5EmztC7QEQMpmgQoMzlZtRYw6xmUqPAfOEo84O19v41bCDpPIrGqjUHRlD94NkkOt7ilpaGpqfI1ArGcvGyuR8RmcCCz20FXaFm+me4caFK0//jlVhnnxD8SyDCycVpaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyBsB3EI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyBsB3EI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9EAC2BCB3;
	Thu, 14 May 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775485;
	bh=/g4jFjZPiFSrClQIiaJoDlvUPxodjYT6LCU7ijnm8BM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LyBsB3EIWVZOr4P93gQNPAlllnr+FlO7i+5WUsP5PoxljT8j8A1jsceMHoeOQxLqQ
	 tF/JAWtAGNiIS+BzPapxpBI7x4dVkyIVxIjYMBQu46DcBd6hNkdixAlSTd2ODUzXVw
	 KENOMYjFVf0FXq8HJXesrVKt6FHUKFIZHJu5GQP70cy91lPP9eMdbUYy1hJegltRA/
	 NJVxDH+GUhXz76+ZH3KOmTzTIHhXmAlY/15fpxEZybIRp1X24bvMb5uyUtt70fAvTF
	 oMLvFjrD6Yn/rjOi/ft4G3JSmwdpzWLZMvGOW2o4zjwSibGBmKhhj4yAn+CLYpMPlI
	 hCHGKfV9xJF7A==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Caleb James DeLisle <cjd@cjdns.fr>
Cc: naseefkm@gmail.com, neil.armstrong@linaro.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260425173642.406089-1-cjd@cjdns.fr>
References: <20260425173642.406089-1-cjd@cjdns.fr>
Subject: Re: [PATCH v3 0/2] phy: econet: Add PCIe PHY driver for EcoNet
 SoCs
Message-Id: <177877548239.1092446.7962897182903086280.b4-ty@kernel.org>
Date: Thu, 14 May 2026 21:48:02 +0530
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 25 Apr 2026 17:36:40 +0000, Caleb James DeLisle wrote:
> I just added explicit includes per the recommendation of
> vladimiroltean/sashiko
> See https://sashiko.dev/#/patchset/20260404184918.2184070-1-cjd@cjdns.fr
> 
> Changes from v2:
> * Added includes per recommendation of vladimiroltean/sashiko
> * Rebased on commit 7080e32d3f09 ("Add linux-next specific files for 20260424")
> * v2: https://lore.kernel.org/linux-mips/20260404184918.2184070-1-cjd@cjdns.fr/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: Document PCIe PHY in EcoNet EN751221 and EN7528
      commit: 2cc066dbd3a211628b40967949cff2790d0f62eb
[2/2] phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.
      commit: da1af49257591190ad6521abb3198f1f40420407

Best regards,
-- 
~Vinod


