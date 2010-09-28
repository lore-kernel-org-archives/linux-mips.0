Received: from mxout1.idt.com ([157.165.5.25]:43822 "EHLO mxout1.idt.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491958Ab0I1Okh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Sep 2010 16:40:37 +0200
Received: from mail.idt.com (localhost [127.0.0.1])
        by mxout1.idt.com (8.13.1/8.13.1) with ESMTP id o8SEeRql004180
        for <linux-mips@linux-mips.org>; Tue, 28 Sep 2010 07:40:30 -0700
Received: from corpml1.corp.idt.com (corpml1.corp.idt.com [157.165.140.20])
        by mail.idt.com (8.13.8/8.13.8) with ESMTP id o8SEePPa015521
        for <linux-mips@linux-mips.org>; Tue, 28 Sep 2010 07:40:27 -0700 (PDT)
Received: from CORPEXCH1.na.ads.idt.com (localhost [127.0.0.1])
        by corpml1.corp.idt.com (8.11.7p1+Sun/8.11.7) with ESMTP id o8SEePM17411
        for <linux-mips@linux-mips.org>; Tue, 28 Sep 2010 07:40:25 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: License file header for a new file
Date: Tue, 28 Sep 2010 07:40:23 -0700
Message-ID: <AEA634773855ED4CAD999FBB1A66D0760115A22F@CORPEXCH1.na.ads.idt.com>
From: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org
Message-ID: <20100928144023.Vs9jHaaiowfE-Y5yKlEFL7j1cuPfQXDL3Tkv3gWQM0U@z>

Hi,

I am porting MIPS Linux from Malta to a new platform. I created a new
file gd-memory.c from the original malta-memory.c and I modified the
code to match the new platform. The original malta-memory.c has the
following header:
/*
 * Carsten Langgaard, carstenl@mips.com
 * Copyright (C) 1999,2000 MIPS Technologies, Inc.  All rights reserved.
 *
 *  This program is free software; you can distribute it and/or modify
it
 *  under the terms of the GNU General Public License (Version 2) as
 *  published by the Free Software Foundation.
 *
 *  This program is distributed in the hope it will be useful, but
WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or
 *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
License
 *  for more details.
 *
 *  You should have received a copy of the GNU General Public License
along
 *  with this program; if not, write to the Free Software Foundation,
Inc.,
 *  59 Temple Place - Suite 330, Boston MA 02111-1307, USA.
 *
 * PROM library functions for acquiring/using memory descriptors given
to
 * us from the YAMON.
 */

What should be the correct header for gd-memory.c?

Thanks,
Andrei
