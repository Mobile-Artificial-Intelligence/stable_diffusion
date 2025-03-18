#ifndef SD_API_H
#define SD_API_H

#if defined(_WIN32) && !defined(__MINGW32__)
    #define SD_DART_API __declspec(dllimport)
#else
    #define SD_DART_API __attribute__ ((visibility ("default")))
#endif

#ifdef __cplusplus
extern "C" {
#endif

SD_DART_API int stable_diffusion_init(char * params);

SD_DART_API char ** stable_diffusion_txt2img(char * params);

SD_DART_API void stable_diffusion_free(void);

#ifdef __cplusplus
}
#endif

#endif