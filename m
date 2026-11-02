Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612300;
	b=yMbrWTl0IOK0PyA0vzLUJ3sMOUZcFKEcco9FRffs5P9D1VJzg85nV19zbUQJpo/e6/JU
	 RisyNmsinfWUohVQe3b7wE/Swhloh76IbaZp2DjVImwebK8iL3w50HUtUy1v5rVLsbmV5
	 UeMkx7Uxjus7nvIvBESqH1OxMxYVKc0zMyaGCswA6QNmUsKRBLwdTDIV/EM9qL8Z+psjK
	 W/KjznfMtST4HLnhb3/ZnASsRJ2eEN9Es6KzvO1cLeWj6DFQP5MWWhGHmNFMCb9Mp3Q3J
	 VfbmKXxU6V6FUValSJpzQS3iSwkCabGIm6wb6YQFMSEIDkTGwzRmGULPh5vGEBrt4Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612300;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=asMl3Kt7eCrFylH1rfiopYNpKGjNZaueRUw6jmEOQ2U=;
	b=r7DgS7toqCtoA7uDksUT3+4xZOZQKfRILrcwgMKoV8onHsJXab5F27eoO1OEj0FkREpg
	 5mh0c27adnnUMFTPm0MbvJjVj2hr9ITSLgSDTwmT2o/wcWBvoPHp8QlZcOx4o2/zwFjpW
	 Xtd50dVMejlot+xk6F3LYFYRbGS8HSHpHsnLLl9rgEr21zBCnCTrWgPL7eyd28bUMk/b3
	 oK7TixYGigEeUHjNqdetSwTJLVg3VQjMoOe8U4dxIrqVsiAZqPNFaq90T/eTm73ZK03hF
	 GyoCJHk8KBPm8iZGBg91BQZx5Z/uUwBZgRbSJEFigbEjeuyeWSm4fS5A2gIqeR1mPfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgMh2Y12;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D1606A326;
	Mon,  2 Nov 2026 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgMh2Y12
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4022D1F000C1;
	Mon,  2 Nov 2026 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612299;
	bh=asMl3Kt7eCrFylH1rfiopYNpKGjNZaueRUw6jmEOQ2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EgMh2Y12vSaPgCSeH1L15Ub1VLcsD0vbTkSPC4HWu21j8YkpnudS0mUiO4yCJ5cbC
	 AJIJSuwoXiD+yxqOWbMD7EwUvXUeRf4KvqA3/l7q+clrIVXWZ2jvbxgP+g4nS6uNe1
	 gohAC6YrQsd8yFN6FQ3iX450k3AfibuA97JPdQwKqyj1Z4Kn+CQlBj1Osljt2pfsdJ
	 uw/LOu/uSc5gTt0nsDN6ryvw0/csx3DlC9pF0BftZ2rDO4S8uupD28QohM7HDy3xFh
	 pzPC8EWD3LiA4CIasOTlYN7Q2QQMNdb7CM6DsQd701LlhZOrjgF+C3q4czIBzPursK
	 ARleo71nDIMYA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 23/53] MIPS: SGI-IP27: xbow_probe(): recognize KLTYPE_PBRICK_XBOW
Date: Mon,  2 Nov 2026 10:37:01 +0100
Message-ID: <20261102093702.29721-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <atyEgXoWLanAHb5V@alpha.franken.de>
References: <cover.1791890466.git.kaloz@kernel.org> <052c08ad27b1b882b27b3ced51f56194ed670637.1791890466.git.kaloz@kernel.org> <atyEgXoWLanAHb5V@alpha.franken.de>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 24, 2026 at 12:12:17PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Oct 13, 2026 at 03:16:43PM +0200, Imre Kaloz wrote:
> >  	brd = find_lboard((lboard_t *)KL_CONFIG_INFO(nasid), KLTYPE_MIDPLANE8);
>
> use
>
> 	brd = find_lboard_class(KL_CONFIG_INFO(nasid), KLCLASS_MIDPLANE);
>
> instead, which looks for all midplane types.

Indeed, KLTYPE_PBRICK_XBOW is a KLCLASS_MIDPLANE type too, so that
covers the IP35 case without the fallback. Will do in v3.

I'll hold v3 until you have had a chance to go through the rest of
the series.


Thanks,
Imre
