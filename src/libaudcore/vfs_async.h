/*
 * vfs_async.c
 * Copyright 2010 Ariadne Conill
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions, and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions, and the following disclaimer in the documentation
 *    provided with the distribution.
 *
 * This software is provided "as is" and without any warranty, express or
 * implied. In no event shall the authors be liable for any damages arising from
 * the use of this software.
 */

#ifndef LIBAUDCORE_VFS_ASYNC_H
#define LIBAUDCORE_VFS_ASYNC_H

#include <functional>
#include <libaudcore/index.h>

using VFSConsumer2 = std::function<void(const char * filename, const Index<char> & buf)>;
void vfs_async_file_get_contents (const char * filename, VFSConsumer2 cons_f);

/* old version -- remove this at next hard API break */
typedef void (* VFSConsumer) (const char * filename, const Index<char> & buf, void * user);
void vfs_async_file_get_contents (const char * filename, VFSConsumer cons_f, void * user);

#endif
