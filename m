Received: from server.a16n.net (server.a16n.net [82.67.174.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CB3CAE73
	for <linux-mips@vger.kernel.org>; Sun, 17 May 2026 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.67.174.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041337; cv=none; b=oI0MTefRsppM9Xmq6Cxb+cKccpcSbstjcddUqJcx1xm3VAeONIEbeym3GyujASRg6fzxZC0ZUO0piX9bAVLfpNH6rh+HvKrspMXZVoGQevWq/33jFvGaB1paJttH5fafb7ZCwH4oYUT3GWymGMpfkbWMKJqwUKNFlS4zRLfci6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041337; c=relaxed/simple;
	bh=MJXINXhbbcG+78/iwyzkVdSDfjkqajL6UToNg5piSTE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rG8xQ1dWK47B2JwfJGlL24z7j9rUT+VoN4DSac6n0K60BPKg5MB0eyC5r2SYpWxqq5Efsv8OgSM+eFoKm96CPK0xkGvaBWFv5D4LBCgVDuxFHFet9oMGayzUWAcgLD2mNpRqKrrMMO9C73+9LtXvdL6/Tpb0k67Owh/190vqF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=a16n.net; spf=pass smtp.mailfrom=a16n.net; dkim=pass (2048-bit key) header.d=a16n.net header.i=@a16n.net header.b=m8T2JsKc; arc=none smtp.client-ip=82.67.174.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=a16n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a16n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=a16n.net header.i=@a16n.net header.b="m8T2JsKc"
Received: from ws.localdomain (21.197.30.93.rev.sfr.net [93.30.197.21])
	by server.a16n.net (Postfix) with ESMTPSA id 86F21640654;
	Sun, 17 May 2026 20:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a16n.net; s=a16n;
	t=1779040943; bh=L8HkmV+E4rUdmPXeKy0rVqRnYxc+viZSx0OVQnZs9qc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=m8T2JsKcnJkfXbq//HgwonrIEPrq3jzZyeSBE9jl1RD2GU0RRMuZYSC7iEq3aHL98
	 yVN0hVqV2NPrwJI9XBBqQnN6+QmFIO7fNjPGjvihujtMjL3n/mLpdwDGfkf8BBgO8z
	 uGY+SL1ehd9XzZhlt6wy8CXuLuwHna/zsLh3u1EejBEelAYI5XxBLZI4+5BYdSQj1Q
	 a6m1YuZuPdPPeUFwkP5JrJrR18s4M17GxgCRuMlJ06ghA/pW0DmcF9FqfoYdq435m2
	 a9O7aQsybUABCY/BymVruWLeVB9BAgQKFj0GCDZ1uBSrWzUZ1OOg+hXDCLSjwt9gby
	 GC7bk6WM3puaw==
Received: by ws.localdomain (Postfix, from userid 1000)
	id 84490306CBF; Sun, 17 May 2026 20:02:22 +0200 (CEST)
From: =?utf-8?Q?Peter_M=C3=BCnster?= <pm@a16n.net>
To: linux-mips@vger.kernel.org
Cc: Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: Asus WL500g Premium (BCM47XX) problem
In-Reply-To: <aZ-Ldi2U-51z3tF5@waldemar-brodkorb.de>
References: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
	<aZ-Ldi2U-51z3tF5@waldemar-brodkorb.de>
Date: Sun, 17 May 2026 20:02:22 +0200
Message-ID: <87y0hhgbip.fsf@a16n.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 26 2026, Waldemar Brodkorb wrote:

> It seems this old patch is good to make the userland more stable.

Hi Waldemar,

Has it been integrated into the kernel, and if yes, in what version
please?

TIA and kind regards,
-- 
           Peter
