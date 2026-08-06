Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97C19E97B
	for <linux-mips@vger.kernel.org>; Thu,  6 Aug 2026 01:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785981381; cv=none; b=DAMH0bhhjnzNFFZkR6s3xX0QWDGSka8Mj86SmInl+rkz6ot0YL1WUMfRK0aA8lZ9YT0iRwBgxUOJrqkiQ/RibVWjZm5LkJsXlSR1VCocFMDJQXpAde6WtH8ltwGMjZAxNvMxHQjUvLkP3IWBVGXo5pvV+VfcE634fm1lvpI+Tgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785981381; c=relaxed/simple;
	bh=fnQL9pfJ6zkb2sXDVDX+3JAkkoGIo7uI/CDKig8CVLM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=EoZlwzudw8K5EovA2v7deagmtxI3Jy8AjkS0AQlACOt0n4frIT1cD9NfA9qpgEG1awad2xkGl95ef6vAp1M73IHocvi+khFVL8B+OrKeVkZ25+sGolDu+53XkTMJ7rUeCxINwUgsvbOYTmzpPs1F1wRpq4KNkSru5HnTZLLy/7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=k2J/jYDX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k2J/jYDX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wM30NtZ1uT8EDrEqQorRBT6W5HyJTLVyH3GVB+5m2mI=; b=k2J/jYDX4oEXRIZzbFFjHD4aju
	rwlX8oVjDyX6jfVBzq77DEW9NNg6QjinEBhTdeobbrucCH0fvIEbTqvpFBwMJ8BkTHBo+WfeYUSJm
	x5/30aQSzKY4pK2i9ghwtXmDwUMG4nl+RE1rgcng297P5UsRXep2itfw0Dk5voBREkWLXHykESkR/
	gO3tVo+bK159KXCOOziGqXVJxWDEZALqipbCdZeismwHOsEIUSbeq8E3awT3FSVVeDSUlmKuA7Maq
	GQxOR2l7VwIDGnDFsT/sr066Idlb1fCcLABvxPBWe1OIAsYynTJjtr/PACaG9DSQCpZwSfx75j3Ab
	xNPae/Pw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrnLE-00000004n0b-3zpw;
	Thu, 06 Aug 2026 01:56:16 +0000
Message-ID: <85609635-09af-4aa2-82ae-f022ee20264d@infradead.org>
Date: Wed, 5 Aug 2026 18:56:16 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: mips randconfig builds?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thomas,


Do you know of a reliable way to generate mips32 randconfig files
and mips64 randconfig files?

I do lots of randconfig builds but I don't have a reliable way to
specify mips 32BIT or mips 64BIT builds.

thanks.
-- 
~Randy

