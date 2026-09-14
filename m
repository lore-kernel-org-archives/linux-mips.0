Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF89493634
	for <linux-mips@vger.kernel.org>; Mon, 14 Sep 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405044; cv=none; b=sC0KMdHFnYkuKWmuQd+/EEC+HW/ysMhcIoFp1HpB8hmCV9V8cX4km2yPYQmkbT3NnMZmRRKmDIeoKgCOsDZrxwPr4xEfsKRaDpvQBWKMMifnnOzeegqfbzqQLhRZJoAmj+G0y8hoF37fJOFHk1D7WTPzWXIbjM9RtPGngminhV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405044; c=relaxed/simple;
	bh=uVw9vIxjDeVFEUcpIkDbKMJ3BRJ2DCL3fmL5T+0sdyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/ZcIAFDPKfLtDwCdRxkJ04O34IQb98JFwa5XSbfAGBrPVYsDfv49F5tNXm+CB14M/P2S4G1tHl3dfMMi9z/n9fjYphE3QsNv1daUqS8G9taDMaZ/U2B7aMyqaMhsBXeDg0rWRk5LZb4aaYn0hkHfVJzG+tV4uI4JfqnYvdv3k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byNSo4NK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZ9hIzcQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byNSo4NK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZ9hIzcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789405041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
	b=byNSo4NKVpFxhJCf2Aqg5A1MVyWjex2PMUqZ+ciLIVtuiE7SCa3PP5nwWH8294jE1aDP1r
	sXoQnQbpBeKlrSx3go/+6k8fQMSeJ36apuDmZvnVhOtw8rhZMZlJ9ffN8vJCpygUbndm7x
	7n+1yWWxhyXgNWHo1wKhlfrrrz/DaOM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17--E5FceOXPEi2rQhKbEvdzA-1; Mon, 14 Sep 2026 12:57:20 -0400
X-MC-Unique: -E5FceOXPEi2rQhKbEvdzA-1
X-Mimecast-MFC-AGG-ID: -E5FceOXPEi2rQhKbEvdzA_1789405040
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so273243485a.3
        for <linux-mips@vger.kernel.org>; Mon, 14 Sep 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789405040; x=1790009840; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
        b=cZ9hIzcQZJSVKN+cSh+lRPy7U/fyCiTT2te8KWy9k6biJcTIzbFj33P41KrRNr6IQE
         QSz0XBMNdfU1m041VDDMdNe7mQEW+IKgRWtcmL/XCAFgT6GAFmyVNc576nv/+M1XxmEx
         LOb4EFxWjMipTr0dyflE0zRPv1/boSjVC9+gV/SK7CrzeGTyrTjZcSapQlzaEZ3xgdVd
         7xTL5JOfMAqHk4K5IO9ZswFPYgTGbPrHEjSWWdJW+y6ogpH0aTHeN3gKeF1mFjeuLHsm
         Nop24QSmkaSvZw+4mxVl5XoQr+M8V/eGfcZfVhhQD8w8NtK12KCxpJpVFOc1rBUo0+fz
         Nb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789405040; x=1790009840;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
        b=V7zLm4gahxe2nuEwCL+icZ7h24Z1F2XmLfKMDH8CzsySPp8frfy3edKs3Gb13jDxFv
         zMGRj3keN8QvnXPauiU2VXd0kj+o3ZEPiojSuLODTijuN4ZnM4/vhUxdCbRkLa08aUeD
         jqUqgvRiYllEUEdjyqAfJUwicOpHAZeYU+DLb6KCDaKW6mdIAsOG60fh9b5KiWXtuEEk
         6e7IKe0bWfAJvVOmjG+xYtv4kU3C1RC5Q1LtSnqrhIu6vTKTyJL+5pSZYje3t+J9GwT7
         K5L2PQj4mPyx4BrSF01EhSMmhZkBWr3YWXanb4cquxhb4azWQO1SKkm8k/34ncKgZYjt
         iwdg==
X-Forwarded-Encrypted: i=1; AKwUvBy1i4XeiazAVrbIgIuWqgC74w3UUnkkVbhdN7TG/VEkEJPa9iSQ4YzqqOsfy7fa+rtr4JWCVAMmRYoI@vger.kernel.org
X-Gm-Message-State: AFuF++late4urokN3i8mLnqnaaDu6IcBNjmWLQ2C+gP1amFebBY/1sfh
	bX3OWLBdsK4jthJsNq/oEkOoeG65UagnLGUfLPzJSL5vFcFinYJOgJfkx7FApFX1Ml/NFR3e3V1
	LpnnUX9yw+qtabx3C17+OzHsmY/sdWx3NPv96mWbPLe6oe4J5iltqZ1liF4yICS4=
X-Gm-Gg: AYBFou1eejYbVc1RkL3QrjljHnUxRmTGQPq0Y59ygKzuhjQCCms3j4/BIr6pJaKg2f3
	78cq1s3xwiuG79gOlKgokbp6UKE2rZPQKad5u2XwdQYTLkMKVmMS0C9E9H/vTYukygu1xVyEUCD
	jzUc9GXpvZzJm6+DZHnFJHTzzo5zRIqjiWFe4ewDGb2ILGR3RBJIqxIHaEtwKxJugHpK8zfcoOu
	68G5+uznfcviMpwX1kwuJP1UR4MS9A5keqttEPWwQluWIHq9pKc+hJ+3F0eJYJZIeKRLo9P6xmt
	9fCq8EM8WVyme+HnBZYOm7i13bVdtWPhR9+2/vvHUlku0/JpxXyoMi5A207TNSArNoqvuuoU49u
	tlGA4926PyzicQv0hTpIgmjsknzApM0nrevE=
X-Received: by 2002:a05:620a:4802:b0:937:7836:1501 with SMTP id af79cd13be357-93a2973a2c7mr527199385a.10.1789405039637;
        Mon, 14 Sep 2026 09:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:937:7836:1501 with SMTP id af79cd13be357-93a2973a2c7mr527194085a.10.1789405039208;
        Mon, 14 Sep 2026 09:57:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f19291sm1072082885a.10.2026.09.14.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:57:18 -0700 (PDT)
Date: Mon, 14 Sep 2026 12:57:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: eyeq: Use devm_platform_ioremap_resource()
Message-ID: <aqgnbA_yMRXczyao@redhat.com>
References: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
 <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Benoît,

On Mon, Sep 14, 2026 at 02:16:44PM +0200, Benoît Monin wrote:
> Convert eqc_probe() from the open-coded platform_get_resource() +
> ioremap() sequence to devm_platform_ioremap_resource(). Besides less
> code, this requests the memory region so the OLB registers are properly
> reserved in the iomem_resource tree.
> 
> Move devm_platform_ioremap_resource() before checking for device match
> data, so OLBs bound without match data also get their memory region
> mapped and reserved.
> 
> Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-eyeq.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index cf37feccc734..3662e6990bf7 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c
> @@ -513,21 +513,16 @@ static int eqc_probe(struct platform_device *pdev)
>  	const struct eqc_match_data *data;
>  	struct clk_hw_onecell_data *cells;
>  	unsigned int i, clk_count;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
>  
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +

As Sashiko pointed out, it would probably make sense to just convert the
rest of the driver over to use the devm_ variants where available (like
of_clk_add_hw_provider).

Brian

